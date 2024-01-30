import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexConnection {
  late PlexAuthorization _auth;

  String host;
  int port;
  PlexCredentials? credentials;
  PlexPinCredentials? pinCredentials;
  PlexHeaders headers;

  PlexConnection({
    required this.host,
    required this.port,
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

  static Future<PlexConnection> withPin(String host, int port,
      PlexPinCredentials pinCredentials, PlexHeaders headers) async {
    var conn = PlexConnection._withPin(
        host: host,
        port: port,
        pinCredentials: pinCredentials,
        headers: headers);

    await conn._setPinAuth();

    return conn;
  }

  PlexConnection._withPin({
    required this.host,
    required this.port,
    required this.pinCredentials,
    required this.headers,
  });

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
        scheme: 'http',
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
