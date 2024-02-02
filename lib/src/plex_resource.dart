class PlexResource {
  final String? name;
  final String? product;
  final String? productVersion;
  final String? platform;
  final String? platformVersion;
  final String? device;
  final List<String>? provides;
  final String? publicAddress;
  final String? accessToken;
  final String? relay;
  final String? httpsRequired;
  final List<PlexResourceConnection>? connections;

  PlexResource({
    this.name,
    this.product,
    this.productVersion,
    this.platform,
    this.platformVersion,
    this.device,
    this.provides,
    this.publicAddress,
    this.accessToken,
    this.relay,
    this.httpsRequired,
    this.connections,
  });
}

class PlexResourceConnection {
  final String protocol;
  final String address;
  final String port;
  final String uri;
  final String local;
  final String relay;
  final String? IPv6;

  PlexResourceConnection(
      {required this.protocol,
      required this.address,
      required this.port,
      required this.uri,
      required this.local,
      required this.relay,
      required this.IPv6});
}
