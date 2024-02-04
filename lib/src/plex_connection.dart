import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexConnection {
  final Uri _resourceEndpoint = Uri.https('plex.tv', '/api/v2/resources');

  late PlexAuthorization _auth;
  List<PlexResource>? resources;

  String? host;
  int? port;
  String? scheme = 'http';
  PlexCredentials? credentials;
  PlexPinCredentials? pinCredentials;
  PlexHeaders headers;

  PlexConnection({
    this.host,
    this.port,
    this.scheme,
    required this.credentials,
    required this.headers,
  }) {
    if (headers == null) {
      headers = PlexHeaders.fromUserCredentials(
        clientIdentifier: '',
        credentials: credentials!,
      );
    } else {
      headers.setCredentials(credentials!);
    }

    _auth = PlexAuthorization(
      credentials: credentials!,
      headers: headers,
    );
  }

  static Future<PlexConnection> withPin(
      {String? host,
      int? port,
      String? scheme,
      required PlexPinCredentials pinCredentials,
      required PlexHeaders headers}) async {
    var conn = PlexConnection._withPin(
        host: host,
        port: port,
        scheme: scheme,
        pinCredentials: pinCredentials,
        headers: headers);

    await conn._setPinAuth();

    return conn;
  }

  PlexConnection._withPin({
    this.host,
    this.port,
    this.scheme,
    required this.pinCredentials,
    required this.headers,
  });

  Future<List<PlexResource>> getServerResources() async {
    if (!authorized) {
      throw UnknownPlexException(
          'Trying to get resources without a connection');
    }

    var response = await http.get(
      _resourceEndpoint,
      headers: headers.toMap(),
    );

    dynamic result = json.decode(response.body);

    resources = result != null
        ? List.generate(
            (result as List<dynamic>).length,
            (index) => PlexResource.fromJson(
              json: result[index],
            ),
          ).where((e) => e.provides!.contains('server')).toList()
        : List.empty();

    return resources!;
  }

  void setDefaultResourceConnection(PlexResource resource) {
    var connection = resource.connections!
        .indexWhere((r) => r.address == resource.publicAddress);
    setResourceConnection(resource.connections![connection]);
  }

  void setResourceConnection(PlexResourceConnection resourceConnection) {
    host = resourceConnection.address;
    port = resourceConnection.port;
  }

  Future<void> _setPinAuth() async {
    _auth = await PlexAuthorization.pinAuthorization(headers);
  }

  Future<PlexConnection> authorize() async {
    dynamic user = await _auth.authorize();

    headers.token = user['authToken'] ?? user['authentication_token'];

    return this;
  }

  bool get authorized => _auth.authorized && headers.token != null;

  Uri get requestUri => Uri(
        scheme: scheme,
        host: host,
        port: port,
      );

  Future<dynamic> requestJson(String route) async =>
      json.decode((await http.get(
        requestUri.replace(path: route),
        headers: headers.toMap(),
      ))
          .body);

  Future<http.Response> requestRaw(String route) async => await http.get(
        requestUri.replace(path: route),
        headers: headers.toMap(),
      );

  PlexRootRoute get root => PlexRootRoute(
        connection: this,
      );
}
