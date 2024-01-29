import 'dart:convert';

class PlexCredentials {
  late String _username;
  late String _password;

  PlexCredentials({
    required username,
    required password,
  })  : assert(username != null && username != null),
        assert(password != null && password != null) {
    _username = username;
    _password = password;
  }

  /// Returns [str] encoded in base64
  String _encode(String str) => base64.encode(utf8.encode(str));

  String get basicAuthHeader => 'Basic ' + _encode('$_username:$_password');
}
