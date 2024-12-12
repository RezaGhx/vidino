import 'package:competition/core/widgets/snackbar/my_snack_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:competition/config/routes/routes.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/feature_login/domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();

  // UseCase
  final LoginUseCase loginUseCase;

  // State
  BaseStatus loginStatus = const BaseInit();

  LoginController(this.loginUseCase);

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void repLogin() async {
    if (keyForm.currentState!.validate()) {
      loginStatus = const BaseLoading();
      update();
      await loginUseCase(phoneNumberController.text).then(
        (value) {
          value.fold(
            (data) {
              loginStatus = BaseComplete<String>(data);
              update();
              print("object");
              print(data);
              Get.toNamed(
                Routes.verificationPage,
                parameters: {
                  "phoneNumber": phoneNumberController.text,
                'userId' :data},
              );
            },
            (error) {
              loginStatus = BaseError(error.message);
              update();
              mySnackBar(title: error.title,content: error.message,isSuccess: false);
            },
          );
        },
      );
    }
  }
}
