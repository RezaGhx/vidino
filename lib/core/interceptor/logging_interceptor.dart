import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoggingInterceptor {
  LoggingInterceptor._();
  static final LoggingInterceptor _singleton = LoggingInterceptor._();
  static LoggingInterceptor get i => _singleton;

  final CurlLoggerDioInterceptor curlLoggerDioInterceptor =
      CurlLoggerDioInterceptor();

  final PrettyDioLogger prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
    enabled: kDebugMode,
  );
}
