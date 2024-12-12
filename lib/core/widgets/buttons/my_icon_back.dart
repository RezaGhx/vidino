import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/core/utils/my_check_platform.dart';

class MyIconBack extends StatelessWidget {
  final void Function()? onTap;
  final Color? iconColor;

  const MyIconBack({super.key, this.onTap, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap == null ? Get.back() : onTap!();
      },
      icon: Icon(
        Icons.arrow_forward_rounded,
        size: 32,
        color: iconColor,
      ),
    );
  }
}
