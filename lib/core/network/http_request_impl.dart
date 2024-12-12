import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../config/resoureces/my_api.dart';
import '../interceptor/logging_interceptor.dart';
import '../interceptor/retry_interceptor.dart';
import '../interceptor/token_interceptor.dart';
import '../utils/error_handler.dart';
import '../utils/my_exception.dart';
import 'http_request.dart';

class HttpRequestImpl implements IHttpRequest {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: MyApi.baseUrl,
      connectTimeout: MyApi.duration,
      sendTimeout: MyApi.duration,
      receiveTimeout: MyApi.duration,
      contentType: 'application/json',
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([
      TokenInterceptor(),
      RetryInterceptor(),
      LoggingInterceptor.i.curlLoggerDioInterceptor,
      LoggingInterceptor.i.prettyDioLogger,
    ]);

  @override
  Future delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future patch({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: header,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future retry({
    required RequestOptions requestOptions,
    ErrorInterceptorHandler? errorHandler,
    RequestInterceptorHandler? requestHandler,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      final response = await _dio.fetch(requestOptions);

      retryList.removeWhere((element) => element == requestOptions);

      if (retryList.isEmpty) {
        Get.back();
      }

      if (errorHandler != null) {
        return errorHandler.resolve(response);
      } else {
        return requestHandler?.resolve(response);
      }
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      throw MyException(
        message: '$e',
      );
    }
  }

  @override
  Future download({
    required String urlPath,
    required String savePath,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    void Function(int count, int total)? onReceive,
    CancelToken? cancelToken,
  }) async {
    try {
      await _dio.download(
        urlPath,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
        onReceiveProgress: onReceive,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }
}
