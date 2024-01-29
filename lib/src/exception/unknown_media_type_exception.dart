class UnknownMediaTypeException implements Exception {
  final String msg;
  const UnknownMediaTypeException(this.msg);

  @override
  String toString() => msg;
}
