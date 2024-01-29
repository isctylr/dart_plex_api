import "package:dart_plex_api/dart_plex_api.dart";

class PlexServer extends PlexObject {
  static final String path = "servers";

  final String? name;
  final String? host;
  final String? address;
  final int? port;
  final String? machineIdentifier;
  final String? version;

  PlexServer({
    required PlexConnection connection,
    this.name,
    this.host,
    this.address,
    this.port,
    this.machineIdentifier,
    this.version,
  }) : super(
          connection: connection,
        );

  @override
  PlexServer.fromJson({
    required PlexConnection connection,
    required dynamic json,
  })  : assert(json != null),
        name = json['name'],
        host = json['host'],
        address = json['address'],
        port = json['port'],
        machineIdentifier = json['machineIdentifier'],
        version = json['version'],
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
      };
}
