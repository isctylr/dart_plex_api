import 'package:dart_plex_api/dart_plex_api.dart';

class PlexRawRoute extends PlexRoute {
  PlexRawRoute({
    required PlexConnection connection,
    required String path,
    String? previousPath,
  })  : assert(connection != null),
        super(
          connection: connection,
          path: path,
          previousPath: previousPath,
        );

  @override
  Future<PlexRawObject> request() async => PlexRawObject.fromJson(
        connection: connection,
        json: (await connection.requestJson(route))['MediaContainer'],
      );
}
