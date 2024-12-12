class MyException implements Exception {
  final String message;
  final String? title;
  final int? statusCode;

  MyException({
    this.message = 'MessageError',
    this.statusCode = 0,
    this.title = '',
  });
}
