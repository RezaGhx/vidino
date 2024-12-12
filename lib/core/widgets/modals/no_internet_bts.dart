import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/extensions/device_size.dart';
import 'package:lottie/lottie.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/widgets/buttons/my_button/my_button.dart';

class NoInternetBts extends StatelessWidget {
  const NoInternetBts({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightDevice / 2,
      width: context.widthDevice,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/no_internet.json',
            fit: BoxFit.cover,
            height: 200,
          ),
          20.0.heightSpace,
          Text(
            'error_no_internet'.tr,
            style: MyTextStyle.style(context: context,
              size: MyFontSize.medium,
              weight: MyFontWeight.normal,
            ),
          ),
          20.0.heightSpace,
          MyButton(
            onTap: onTap,
            title: 'try_again'.tr,
            size: MyButtonSize.small,
          ),
        ],
      ),
    );
  }
}
