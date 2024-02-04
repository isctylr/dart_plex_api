import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexPinCredentials {
  late int pinId;
  late String pinCode;

  late String token;

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

    pinId = result['id'];
    pinCode = result['code'];

    return this;
  }

  Future<String> getToken(PlexHeaders headers) async {
    if (headers.token == token) {
      return token;
    }
    Uri tokenEndpoint = Uri.https('plex.tv', 'api/v2/pins/$pinId');

    var _headers = headers.toMap();
    _headers = {..._headers, 'code': pinCode};

    var response = await http.post(
      tokenEndpoint,
      headers: _headers,
    );

    dynamic result = json.decode(response.body);

    var error = result['error'];

    if (error != null) {
      throw UnknownPlexException(error.toString());
    }

    token = result['authToken'];

    return token;
  }
}
