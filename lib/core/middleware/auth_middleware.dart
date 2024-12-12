import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/config/routes/routes.dart';
import 'package:competition/core/utils/auth_storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (AuthStorage.isLogin()) {
      print("object");
      print(AuthStorage.tokenParams);
      return const RouteSettings(name: Routes.homePage);
    } else {
      return null;
    }
  }
}
