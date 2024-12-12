import 'package:dio/dio.dart';
import 'my_exception.dart';

class ErrorHandler {
  static void handleError(DioException e) {
    print("error");
    print(e.response);
    if (e.response?.data['Message'] == null &&
        e.response?.data['subErrors'] == null) {
      throw MyException(
        title: e.response!.data["title"] ?? 'Error Title',
        message: e.response!.data["Message"] ?? 'Error',
        statusCode: e.response?.statusCode,
      );
    } else if (e.response?.data['subErrors'] != null) {
      if (e.response?.data['subErrors'] is List) {
        if ((e.response?.data['subErrors'] as List).isNotEmpty) {
          throw MyException(
            message: '${e.response?.data['subErrors'][0] ?? e.message}',
            statusCode: e.response?.statusCode,
          );
        }
      }
    } else if (e.response!.data["Message"] != null) {
      throw MyException(
        title: e.response!.data["title"] ?? 'Error Title',
        message: e.response!.data["Message"] ?? e.message,
        statusCode: e.response?.statusCode,
      );
    } else {
      throw MyException(
        title: 'Error Title',
        message: 'Error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
