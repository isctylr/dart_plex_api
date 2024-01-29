import 'package:dart_plex_api/dart_plex_api.dart';

class PlexAllLibrarySectionsRoute extends PlexRoute {
  final PlexLibrarySectionIndexRoute indexRoute;

  PlexAllLibrarySectionsRoute({
    required PlexConnection connection,
    required this.indexRoute,
    String? previousPath,
  })  : assert(indexRoute != null),
        super(
          connection: connection,
          path: '',
          previousPath: previousPath,
        );

  @override
  Future<List<PlexObject>> request() async {
    var index = await indexRoute.request();
    var sections = List<PlexObject>.empty();

    if (index.directory != null) {
      await Future.forEach(
        index.directory!,
        (PlexLibrarySection section) async => sections.add(
          await PlexLibrarySectionRoute(
            connection: connection,
            key: section.key,
            typeString: section.type,
            previousPath: indexRoute.route,
          ).request(),
        ),
      );
    }

    return sections;
  }
}
