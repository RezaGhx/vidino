import 'package:competition/config/constants/constans.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/utils/my_check_theme.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/extensions/validator.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/back_ground/my_background.dart';
import 'package:competition/core/widgets/buttons/my_button/my_button.dart';
import 'package:competition/core/widgets/text/my_text_field.dart';
import 'package:competition/feature_login/presentation/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForm,
      autovalidateMode: AutovalidateMode.disabled,
      child: Scaffold(
        // appBar: MyAppBar(
        //   title: 'register_login'.tr,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: MyBackground(
              isExpanded: false,
              color: MyColor.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  80.responseHeight.heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png",width: 50,height: 50,
                      color: myCheckTheme(context, MyColor.white, MyColor.black),),
                      Text('ویدینو',style: MyTextStyle.style(context: context,
                          size: MyFontSize.medium,
                          weight: MyFontWeight.bold),),

                    ],
                  ),
                  30.responseHeight.heightSpace,
                  MyContainerPublic(
                    backgroundColor: MyColor.slightlyDarker,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "login".tr,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.style(context: context,
                              size: MyFontSize.medium,
                              weight: MyFontWeight.bold,
                            ),
                          ),
                        ),
                        15.responseHeight.heightSpace,
                        Center(
                          child: Text(
                            "text_login".tr,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.style(context: context,
                              size: MyFontSize.small,
                              weight: MyFontWeight.normal,
                            ),
                          ),
                        ),
                        25.responseHeight.heightSpace,
                        Column(
                          children: [
                            MyTextField(
                              controller: controller.phoneNumberController,
                              keyboardType: TextInputType.phone,
                              hintText: '9 8 7 6 5 4 3 2 1 9 0',
                              textAlign: TextAlign.center,
                              maxLength: 11,
                              style: MyTextStyle.style(context: context,
                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                              validator: (value) => value.phoneNumberValidate(),
                            ),
                            15.responseHeight.heightSpace,
                            GetBuilder<LoginController>(
                              builder: (controller) => MyButton(
                                onTap: () {
                                  if (controller.loginStatus is! BaseLoading) {
                                    controller.repLogin();
                                  }
                                },
                                title: 'register_login'.tr,
                                // icon: MyIcon.Profile,
                                size: MyButtonSize.small,
                                isLoading: controller.loginStatus is BaseLoading,
                                expanded: true,
                              ),
                            )
                          ],
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
