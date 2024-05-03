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
  final bool? relay;
  final bool? httpsRequired;
  late final List<PlexResourceConnection>? connections;

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

  PlexResource.fromJson({dynamic json})
      : assert(json != null),
        name = json['name'],
        product = json['product'],
        productVersion = json['productVersion'],
        platform = json['platform'],
        platformVersion = json['platformVersion'],
        device = json['device'],
        provides = json['provides'] != null
            ? json['provides'].toString().split(',')
            : List.empty(),
        publicAddress = json['publicAddress'],
        accessToken = json['accessToken'],
        relay = json['relay'],
        httpsRequired = json['httpsRequired'],
        connections = json['connections'] != null
            ? List.generate(
                (json['connections'] as List<dynamic>).length,
                (int index) => PlexResourceConnection.fromJson(
                  json: json['connections'][index],
                ),
              )
            : List.empty();
}

class PlexResourceConnection {
  final String protocol;
  final String address;
  final int port;
  final String uri;
  final bool local;
  final bool relay;
  final bool? IPv6;

  PlexResourceConnection(
      {required this.protocol,
      required this.address,
      required this.port,
      required this.uri,
      required this.local,
      required this.relay,
      required this.IPv6});

  PlexResourceConnection.fromJson({dynamic json})
      : assert(json != null),
        protocol = json['protocol'],
        address = json['address'],
        port = json['port'],
        uri = json['uri'],
        local = json['local'],
        relay = json['relay'],
        IPv6 = json['IPv6'];
}
