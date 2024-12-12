import 'package:competition/config/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



myShowMyDialogs({Widget? child}) {
  Get.dialog(
    Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
      // حذف فضای اضافی در طرفین
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: child,
    ),
  );
}
