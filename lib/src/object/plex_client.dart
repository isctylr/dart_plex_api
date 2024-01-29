import 'package:dart_plex_api/dart_plex_api.dart';

class PlexClient extends PlexObject {
  static final String path = 'clients';

  final String? name;
  final String? host;
  final String? address;
  final int? port;
  final String? machineIdentifier;
  final String? version;
  final String? protocol;
  final String? product;
  final String? deviceClass;
  final String? protocolVersion;
  final String? protocolCapabilities;

  PlexClient({
    required PlexConnection connection,
    this.name,
    this.host,
    this.address,
    this.port,
    this.machineIdentifier,
    this.version,
    this.protocol,
    this.product,
    this.deviceClass,
    this.protocolVersion,
    this.protocolCapabilities,
  }) : super(
          connection: connection,
        );

  @override
  PlexClient.fromJson({
    required PlexConnection connection,
    required dynamic json,
  })  : assert(json != null),
        name = json['name'],
        host = json['host'],
        address = json['address'],
        port = json['port'],
        machineIdentifier = json['machineIdentifier'],
        version = json['version'],
        protocol = json['protocol'],
        product = json['product'],
        deviceClass = json['deviceClass'],
        protocolVersion = json['protocolVersion'],
        protocolCapabilities = json['protocolCapabilities'],
        super(
          connection: connection,
        );

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'host': host,
        'address': address,
        'port': port,
        'machineIdentifier': machineIdentifier,
        'version': version,
        'protocol': protocol,
        'product': product,
        'deviceClass': deviceClass,
        'protocolVersion': protocolVersion,
        'protocolCapabilities': protocolCapabilities,
      };
}
