import 'package:dart_plex_api/dart_plex_api.dart';

class PlexLibraryRoute extends PlexRoute {
  PlexLibraryRoute({
    required PlexConnection connection,
    String? previousPath,
  }) : super(
          connection: connection,
          path: PlexLibrary.route,
          previousPath: previousPath,
        );

  PlexLibrarySectionIndexRoute get sections => PlexLibrarySectionIndexRoute(
        connection: connection,
        previousPath: route,
      );

  @override
  Future<PlexLibrary> request() async => PlexLibrary.fromJson(
        connection: connection,
        json: (await connection.requestJson(route))['MediaContainer'],
      );
}
