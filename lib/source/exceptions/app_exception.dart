class AppException implements Exception {}

class AppExceptionUnknown extends AppException {
  AppExceptionUnknown(this.original);

  final dynamic original;

  @override
  String toString() {
    return 'AppExceptionUnknown: $original';
  }
}
