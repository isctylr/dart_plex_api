class MissingHeadersPlexException implements Exception {
  final String msg;
  const MissingHeadersPlexException(this.msg);

  @override
  String toString() => msg;
}
