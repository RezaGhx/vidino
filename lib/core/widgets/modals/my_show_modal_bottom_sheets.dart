import 'package:competition/config/theme/my_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'my_modal_bottom_sheet.dart';


showMyModalBottomSheet({String? title, TextStyle? styleTitle, Widget? child,Widget? childModal}) {
  Get.bottomSheet(
      childModal ?? MyModalBottomSheet(
        title: title,
        styleTitle: styleTitle,
        child: child,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Get.theme.blurModal.withOpacity(0.8),
      isScrollControlled: true);
}

