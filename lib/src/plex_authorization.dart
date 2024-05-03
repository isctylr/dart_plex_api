import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexAuthorization {
  // For getting a user via user/pw
  final Uri _authEndpoint = Uri.https('plex.tv', '/users/sign_in.json');
  // For getting a user with a token
  final Uri _userEndpoint = Uri.https('plex.tv', '/api/v2/user');

  PlexCredentials? credentials;
  PlexPinCredentials? pinCredentials;

  PlexHeaders headers;

  dynamic _user;

  PlexAuthorization({
    required this.credentials,
    required this.headers,
  }) {
    headers.setCredentials(credentials!);
  }

  PlexAuthorization._pinCredentials({
    required this.headers,
  });

  static Future<PlexAuthorization> pinAuthorization(PlexHeaders headers) async {
    var auth = PlexAuthorization._pinCredentials(headers: headers);
    var pinCred = PlexPinCredentials.createPin(headers);

    auth.pinCredentials = await pinCred;

    return auth;
  }

  Future<dynamic> authorize() async {
    if (credentials != null) {
      // Created via original way - user/password
      var response = await http.post(
        _authEndpoint,
        headers: headers.toMap(),
      );

      dynamic result = json.decode(response.body);

      var error = result['error'];

      if (error != null) {
        throw getException(error);
      }

      _user = result['user'];

      return _user;
    } else if (pinCredentials != null) {
      // Created with pin signin. Get/set auth token & user
      var token = await pinCredentials!.getToken(headers);
      headers.token = token;

      var response = await http.get(
        _userEndpoint,
        headers: headers.toMap(),
      );

      dynamic result = json.decode(response.body);

      var errors = result['errors'];

      if (errors != null) {
        throw getException(errors[0].message.toString());
      }

      _user = result;

      return _user;
    } else {
      throw UnknownPlexException('Authorizing without setting credentials');
    }
  }

  bool get authorized => _user != null;

  Exception getException(String msg) {
    switch (msg) {
      case 'Invalid email, username, or password.':
        return InvalidCredentialsPlexException(msg);
      case 'You appear to be having trouble signing in to an account. You may wish to try resetting your password at https://plex.tv/reset':
        return InvalidCredentialsPlexException(msg);
      case 'Plex client headers are required':
        return MissingHeadersPlexException(msg);
      case 'Code not found or expired':
        return InvalidCredentialsPlexException(msg);
      default:
        return UnknownPlexException(msg);
    }
  }
}
