import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexPinCredentials {
  late int pinId;
  late String pinCode;

  String? token;

  final Uri _genPinEndpoint =
      Uri.https('plex.tv', '/api/v2/pins.json', {'strong': 'true'});

  PlexPinCredentials._init();

  static Future<PlexPinCredentials> createPin(PlexHeaders headers) async {
    var pinCred = PlexPinCredentials._init();

    await pinCred._createPin(headers);

    return pinCred;
  }

  Future<PlexPinCredentials> _createPin(PlexHeaders headers) async {
    var response = await http.post(
      _genPinEndpoint,
      headers: headers.toMap(),
    );

    dynamic result = json.decode(response.body);

    var error = result['error'];

    if (error != null) {
      // throw getException(error);
      throw UnknownPlexException(error.toString());
    }

    return this;
  }

  /// Checks plex.tv for [token], which will be null if no sign in has been made yet.
  Future<String?> getToken(PlexHeaders headers) async {
    if (token != null && headers.token == token) {
      return token;
    }
    Uri tokenEndpoint = Uri.https('plex.tv', 'api/v2/pins/$pinId');

    var _headers = headers.toMap();
    _headers = {..._headers, 'code': pinCode};

    var response = await http.get(
      tokenEndpoint,
      headers: _headers,
    );

    dynamic result = json.decode(response.body);

    var errors = result['errors'];

    if (errors != null) {
      throw UnknownPlexException(errors[0].message.toString());
    }

    if (result['authToken'] == null) {
      throw NoSignInOnPinPlexException('No sign in yet.');
    }

    token = result['authToken'];

    return token;
  }
}
