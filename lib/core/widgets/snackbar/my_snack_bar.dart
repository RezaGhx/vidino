import 'dart:ui';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


mySnackBar({String? title, String? content, bool? isSuccess,
    SnackPosition? snackPosition}) {
  Get.closeCurrentSnackbar();
  Get.snackbar(
    "",
    "",
    backgroundColor: isSuccess!?MyColor.green.withOpacity(0.80):MyColor.red.withOpacity(0.80),
    colorText: MyColor.white,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
    duration: const Duration(milliseconds: 3500),
    snackPosition: snackPosition??SnackPosition.TOP,
    titleText: Text(title??"", style: MyTextStyle.style(context: Get.context,
        mode: MyColor.neaDarkFc,
        size: MyFontSize.small,
        weight: MyFontWeight.bold)),
    messageText: Center(
        child: Text(content??"",
            style: MyTextStyle.style(context: Get.context,
                mode: MyColor.white,
                size: MyFontSize.medium,
                weight: MyFontWeight.normal))),
  );
}