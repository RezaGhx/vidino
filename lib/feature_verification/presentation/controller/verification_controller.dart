import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:competition/config/routes/routes.dart';
import 'package:competition/core/params/verify_param.dart';
import 'package:competition/core/utils/auth_storage.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/feature_login/domain/usecase/login_usecase.dart';
import 'package:competition/feature_verification/domain/usecase/verify_code_usecase.dart';
import 'package:otp_autofill/otp_autofill.dart';

import '../../../core/widgets/snackbar/my_snack_bar.dart';

class VerificationController extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController codeVerify =
      TextEditingController(text: "");
  Timer? timer;
  int second = -1;
  String phoneNumber = Get.parameters["phoneNumber"] ?? "";
  String userId = Get.parameters["userId"] ?? "";
  late OTPTextEditController controller;
  late OTPInteractor _otpInteractor;

  // UseCase
  final VerifyCodeUseCase verifyCodeUseCase;
  final LoginUseCase loginUseCase;

  // State
  BaseStatus verifyStatus = const BaseInit();
  BaseStatus loginStatus = const BaseInit();

  VerificationController(this.verifyCodeUseCase, this.loginUseCase);

  @override
  void onInit() {
    super.onInit();
    _initInteractor();
    codeVerify.addListener(_updateText);
    startTimer();
    readSmsOtp();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    codeVerify.dispose();
    codeVerify
      ..removeListener(_updateText)
      ..dispose();

    super.dispose();
  }

  verifyCodeEvent() async {
    if (keyForm.currentState!.validate()) {
      VerifyParam verifyParam = VerifyParam(
        userId: userId,
        verifyCode: codeVerify.text,
      );
      verifyStatus = const BaseLoading();
      update();

      await verifyCodeUseCase(verifyParam).then((value) {
        value.fold((data) async {
          verifyStatus = BaseComplete<dynamic>(data);
          await AuthStorage.saveData(newTokenParams: data.token!);
            Get.offAllNamed(
              Routes.homePage,
              arguments: {'profileEntity': '$data'},
            );

        }, (error) {
          verifyStatus = BaseError(error.message);
          Get.closeCurrentSnackbar();
          mySnackBar(title: error.title,content: error.message,isSuccess: false);

        });
      });
    }
  }

  Future<void> _initInteractor() async {
    _otpInteractor = OTPInteractor();

    // You can receive your app signature by using this method.
    final appSignature = await _otpInteractor.getAppSignature();
    update();
    if (kDebugMode) {
      print('Your app signature: $appSignature');
    }
  }

  void startTimer() {
    second = 60;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (second == 0) {
        codeVerify.clear();
        timer.cancel();
        loginStatus = const BaseError('');
      } else {
        second = second - 1;
      }
      update();
    });
  }

  void _updateText() {
    String text = codeVerify.text;
    text = text.replaceAll('-', '');
    String newText = '';

    for (int i = 0; i < 6; i++) {
      if (i < text.length) {
        newText += text[i];
      } else {
        newText += '-';
      }
    }

    int cursorPosition = newText.indexOf('-');
    if (cursorPosition == -1) {
      cursorPosition = newText.length;
    }

    codeVerify.value = codeVerify.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
    update();
  }

  String getTextCounter() {
    return "send_code_to_number".tr.replaceAll("09123456789", phoneNumber);
  }

  void repLogin() async {
    codeVerify.clear();
    loginStatus = const BaseInit();
    update();

    await loginUseCase(phoneNumber).then(
      (value) {
        value.fold(
          (data) {
            startTimer();
            readSmsOtp();
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

  readSmsOtp() {
    controller = OTPTextEditController(
      codeLength: 6,

      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
          (code) {
        if (code!.contains("کد ورود به آیدال:")) {
          final exp = RegExp(r'(\d{6})');
          codeVerify.text = exp.stringMatch(code)!;
          update();
          return exp.stringMatch(code) ?? '';
        }
        return "";
      },
      strategies: [
        SampleStrategy(),
      ],
    );
    update();
  }

}
class SampleStrategy extends OTPStrategy {
  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 60),
          () => 'Your code is 424568',
    );
  }
}
