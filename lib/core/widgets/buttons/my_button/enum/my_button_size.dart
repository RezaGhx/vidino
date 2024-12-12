import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/extensions/device_size.dart';

enum MyButtonSize {
  small,
  medium;

  static Map<MyButtonSize, Size> get size => {
    MyButtonSize.small: const Size(135, 30),
    MyButtonSize.medium: const Size(135, 50),
  };

  static Map<MyButtonSize, Size> get expandedSize => {
    MyButtonSize.small: Size(Get.context!.widthDevice, 30),
    MyButtonSize.medium: Size(Get.context!.widthDevice, 50),
  };

  static Map<MyButtonSize, double> get iconSize => {
    MyButtonSize.small: 20,
    MyButtonSize.medium: 24,
  };

  static Map<MyButtonSize, TextStyle> get fontSize => {
    MyButtonSize.small: MyTextStyle.style(context: Get.context,
      size: MyFontSize.small,
      weight: MyFontWeight.normal,
    ),
    MyButtonSize.medium: MyTextStyle.style(context: Get.context,
      size: MyFontSize.medium,
      weight: MyFontWeight.normal,
    ),
  };
}