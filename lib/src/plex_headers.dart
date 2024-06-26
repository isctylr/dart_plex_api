import 'package:dart_plex_api/dart_plex_api.dart';

class PlexHeaders {
  /// X-Plex-Platform	(Platform name, eg iOS, MacOSX, Android, LG, etc)
  String platform;

  /// X-Plex-Platform-Version	(Operating system version, eg 4.3.1, 10.6.7, 3.2)
  String platformVersion;

  /// X-Plex-Provides	(one or more of [player, controller, server])
  String provides;

  /// X-Plex-Client-Identifier	(UUID, serial number, or other number unique per device)
  String clientIdentifier;

  /// X-Plex-Product	(Plex application name, eg Laika, Plex Media Server, Media Link)
  String product;

  /// X-Plex-Version	(Plex application version number)
  String version;

  /// X-Plex-Device	(Device name and model number, eg iPhone3,2, Motorola XOOM™, LG5200TV)
  String device;

  /// X-Plex-Container-Size	(Paging Size, eg Plex-Container-Size=1)
  String containerSize;

  /// X-Plex-Token	(Authentication token)
  String? token;

  /// code (Code used for pin auth)
  String? code;

  /// Accept
  String accept;

  /// Authorization
  String? authorization;

  PlexHeaders({
    required this.clientIdentifier,
    this.platform = '',
    this.platformVersion = '',
    this.provides = '',
    this.product = '',
    this.version = '',
    this.device = '',
    this.containerSize = '',
    this.token,
    this.accept = 'application/json',
    this.authorization,
  }) : assert(clientIdentifier != null && clientIdentifier != '');

  PlexHeaders.fromUserCredentials({
    required PlexCredentials credentials,
    required this.clientIdentifier,
    this.platform = '',
    this.platformVersion = '',
    this.provides = '',
    this.product = '',
    this.version = '',
    this.device = '',
    this.containerSize = '',
    // this.token = '',
    this.accept = 'application/json',
  })  : assert(credentials != null),
        assert(clientIdentifier != null && clientIdentifier != '') {
    setCredentials(credentials);
  }

  void setCredentials(PlexCredentials credentials) =>
      authorization = credentials.basicAuthHeader;

  // void setToken(String token) =>
  //     this.token = token;

  // Use user or token auth
  Map<String, String> toMap() {
    var map = {
      'X-Plex-Platform': platform,
      'X-Plex-Platform-Version': platformVersion,
      'X-Plex-Provides': provides,
      'X-Plex-Client-Identifier': clientIdentifier,
      'X-Plex-Product': product,
      'X-Plex-Version': version,
      'X-Plex-Device': device,
      'X-Plex-Container-Size': containerSize,
      'X-Plex-Token': token ?? '',
      'Accept': accept,
      'Authorization': authorization ?? '',
    };
    map.removeWhere((_, val) => val == '');
    return map;
  }
}
