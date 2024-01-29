import 'package:dart_plex_api/dart_plex_api.dart';

class PlexRootRoute extends PlexRoute {
  PlexRootRoute({
    required PlexConnection connection,
  })  : assert(connection != null),
        super(
          connection: connection,
          path: PlexRoot.path,
        );

  PlexLibraryRoute get library => PlexLibraryRoute(
        connection: connection,
        previousPath: route,
      );

  PlexServersRoute get servers => PlexServersRoute(
        connection: connection,
        previousPath: route,
      );

  PlexClientsRoute get clients => PlexClientsRoute(
        connection: connection,
        previousPath: route,
      );

  @override
  Future<PlexRoot> request() async => PlexRoot.fromJson(
        connection: connection,
        json: (await connection.requestJson(route))['MediaContainer'],
      );
}
