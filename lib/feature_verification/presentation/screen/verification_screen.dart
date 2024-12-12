import 'package:competition/core/extensions/device_size.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/buttons/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/extensions/validator.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/back_ground/my_background.dart';
import 'package:competition/core/widgets/buttons/my_button/my_button.dart';
import 'package:competition/core/widgets/text/my_text_field.dart';
import 'package:competition/feature_verification/presentation/controller/verification_controller.dart';

import '../../../config/resoureces/my_color.dart';
import '../../../core/utils/my_check_theme.dart';
import '../../../core/widgets/containers/my_container_public.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForm,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: MyBackground(
              isExpanded: false,
              color: MyColor.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  140.responseHeight.heightSpace,
                  MyContainerPublic(
                    backgroundColor: myCheckTheme(context, MyColor.slightlyDarker, MyColor.shadeLight50),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'کد ارسال شده به شماره زیر را وارد کنید',
                          style: MyTextStyle.style(context: context,
                              size: MyFontSize.xSmall, weight: MyFontWeight.bold),
                        ),
                        20.responseHeight.heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controller.phoneNumber,
                              style: MyTextStyle.style(context: context,
                                  size: MyFontSize.xSmall, weight: MyFontWeight.bold),
                            ),
                            MyContainerPublic(
                              backgroundColor: MyColor.transparent,
                              onTap: (){
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  const MyIconButton(
                                    icon: Icons.edit_square,
                                    iconSize: 17,
                                  ),
                                  8.responseWidth.widthSpace,
                                  Text(
                                    'اصلاح شماره',
                                    style: MyTextStyle.style(context: context,
                                        size: MyFontSize.xSmall, weight: MyFontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        20.responseHeight.heightSpace,
                        MyTextField(
                          validator: (value) {
                            return value.verificationCodeValidate();
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          controller: controller.codeVerify,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          style: MyTextStyle.style(context: context,
                              size: MyFontSize.small,
                              weight: MyFontWeight.bold),
                          maxLength: 6,
                        ),
                        18.responseHeight.heightSpace,

                        GetBuilder<VerificationController>(
                          builder: (controller) {
                            if (controller.loginStatus is BaseError) {
                              return Column(
                                children: [
                                  MyButton(
                                    onTap: () {
                                      if (controller.loginStatus is! BaseLoading) {
                                        controller.repLogin();
                                      }
                                    },
                                    title: 'resend'.tr,
                                    expanded: true,
                                    size: MyButtonSize.small,
                                    isLoading: controller.loginStatus is BaseLoading,
                                  ),

                                ],
                              );
                            } else {
                              return MyButton(
                                onTap: () {
                                  if (controller.verifyStatus is! BaseLoading) {
                                    controller.verifyCodeEvent();
                                  }
                                },
                                title: 'verify_code'.tr,
                                size: MyButtonSize.small,
                                isLoading: controller.verifyStatus is BaseLoading,
                                expanded: true,
                              );
                            }
                          },
                        ),

                        GetBuilder<VerificationController>(
                          builder: (controller) {
                            if (controller.second != 0) {
                              return MyContainerPublic(
                                width: context.widthDevice,
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 18.responseHeight,top: 10),
                                  child: Text(
                                    'alert_counter'.tr.replaceAll(
                                        "1000", controller.second.toString()),
                                    textAlign: TextAlign.right,
                                    style: MyTextStyle.style(
                                        mode: MyColor.neaDarkGrey,
                                        context: context,
                                        size: MyFontSize.xSmall,
                                        weight: MyFontWeight.normal),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
