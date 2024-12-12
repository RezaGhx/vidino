import 'package:dio/dio.dart';

abstract class IHttpRequest {
  Future<dynamic> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  });

  Future<dynamic> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  });

  Future<dynamic> put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  });

  Future<dynamic> patch({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  });

  Future<dynamic> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  });

  Future download({
    required String urlPath,
    required String savePath,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    void Function(int count, int total)? onReceive,
    CancelToken? cancelToken,
  });

  Future retry({
    required RequestOptions requestOptions,
    ErrorInterceptorHandler? errorHandler,
    RequestInterceptorHandler? requestHandler,
  });
}
