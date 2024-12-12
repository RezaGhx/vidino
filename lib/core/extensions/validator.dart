import 'dart:async';
import 'package:get/get.dart';

Timer? debounce;

extension Validator on String? {
  String? phoneNumberValidate() {
    if (this == null || this!.isEmpty) {
      return 'required_phone_number'.tr;
    } else if (this!.length < 11 ||
        this!.startsWith('0', 0) == false ||
        this!.startsWith('9', 1) == false) {
      return 'failed_phone_number'.tr;
    } else {
      return null;
    }
  }

  String? phoneNumberRegisterValidate() {
    if (this == null || this!.isEmpty) {
      return 'required_phone_number'.tr;
    }
    return null;
  }

  String? homeNumberValidate() {
    if (this == null || this!.isEmpty) {
      return 'required_home_number'.tr;
    } else if (this!.length < 11) {
      return 'failed_home_number'.tr;
    } else {
      return null;
    }
  }

  String? verificationCodeValidate() {
    if (this == null || this!.isEmpty) {
      return 'error_send_otp'.tr;
    } else if (!isValidFourDigitNumber()) {
      return 'error_send_otp'.tr;
    } else {
      return null;
    }
  }

  bool isValidFourDigitNumber() {
    final regex = RegExp(r'^\d{6}$');
    return regex.hasMatch(this!);
  }

  String? publicValidate({String? messageError}) {
    if (this == null || this!.isEmpty) {
      return messageError!.tr;
    }
    return null;
  }
}
