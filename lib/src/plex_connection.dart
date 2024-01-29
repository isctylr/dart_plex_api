import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexConnection {
  late PlexAuthorization _auth;

  String host;
  int port;
  PlexCredentials credentials;
  PlexHeaders headers;

  // TODO: Hash Password
  PlexConnection({
    required this.host,
    required this.port,
    required this.credentials,
    required this.headers,
  })  : assert(host != null),
        assert(port != null),
        assert(credentials != null) {
    if (headers == null) {
      headers = PlexHeaders.fromCredentials(
        clientIdentifier: '',
        credentials: credentials,
      );
    } else {
      headers.setCredentials(credentials);
    }

    _auth = PlexAuthorization(
      credentials: credentials,
      headers: headers,
    );
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
