import 'package:dart_plex_api/dart_plex_api.dart';

class PlexLibrarySectionIndexRoute extends PlexRoute {
  PlexLibrarySectionIndexRoute({
    required PlexConnection connection,
    String? previousPath,
  }) : super(
          connection: connection,
          path: PlexLibrarySectionIndex.path,
          previousPath: previousPath,
        );

  PlexLibrarySectionRoute get({
    required String key,
    required String typeString,
  }) =>
      PlexLibrarySectionRoute(
        connection: connection,
        key: key,
        typeString: typeString,
        previousPath: route,
      );

  PlexAllLibrarySectionsRoute get all => PlexAllLibrarySectionsRoute(
        connection: connection,
        indexRoute: this,
        previousPath: route,
      );

  @override
  Future<PlexLibrarySectionIndex> request() async =>
      PlexLibrarySectionIndex.fromJson(
        connection: connection,
        json: (await connection.requestJson(route))['MediaContainer'],
      );
}
