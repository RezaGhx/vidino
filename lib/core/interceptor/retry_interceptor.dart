import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/core/network/http_request.dart';
import 'package:competition/core/utils/check_connection.dart';
import 'package:competition/core/widgets/modals/no_internet_bts.dart';

import '../../config/routes/routes.dart';
import '../utils/auth_storage.dart';

List<RequestOptions> retryList = [];

class RetryInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final IHttpRequest httpRequest = Get.find();
    ///Auth token is invalid
    if(err.response!=null && err.response!.statusCode==401){
      await Future.wait([
        AuthStorage.deleteData(),
      ]);
      Get.offAllNamed(Routes.loginPage);
    }else if (err.type == DioExceptionType.connectionError || err.type == DioExceptionType.connectionTimeout) {
      if (retryList.isEmpty) {
        if (!retryList.contains(err.requestOptions)) {
          retryList.add(err.requestOptions);
        }
        await Get.bottomSheet(
          backgroundColor: MyColor.white,
          NoInternetBts(
            onTap: () async {
              for (RequestOptions v in retryList) {
                httpRequest.retry(requestOptions: v, errorHandler: handler);
                Get.back();
              }
            },
          ),
        );
      } else {
        if (retryList.contains(err.requestOptions)) {
          retryList.add(err.requestOptions);
        }
      }
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final IHttpRequest httpRequest = Get.find();

    if (await CheckConnection.isConnected()) {
      handler.next(options);
    } else {
      if (retryList.isEmpty) {
        if (!retryList.contains(options)) {
          retryList.add(options);
        }
        await Get.bottomSheet(
          backgroundColor: MyColor.white,
          NoInternetBts(
            onTap: () async {
              for (RequestOptions v in retryList) {
                httpRequest.retry(requestOptions: v, requestHandler: handler);
                Get.back();
              }
            },
          ),
        );
      } else {
        if (!retryList.contains(options)) {
          retryList.add(options);
        }
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
