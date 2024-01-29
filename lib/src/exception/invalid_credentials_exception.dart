class InvalidCredentialsPlexException implements Exception {
  final String msg;
  const InvalidCredentialsPlexException(this.msg);

  @override
  String toString() => 'Invalid email, username, or password.';
}
