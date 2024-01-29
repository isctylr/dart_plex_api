class UnknownPlexException implements Exception {
  final String msg;
  const UnknownPlexException(this.msg);

  @override
  String toString() => msg;
}
