class NoSignInOnPinPlexException implements Exception {
  final String msg;
  const NoSignInOnPinPlexException(this.msg);

  @override
  String toString() => msg;
}
