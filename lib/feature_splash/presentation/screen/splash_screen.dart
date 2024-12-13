import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/core/widgets/buttons/my_button/my_button.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:competition/feature_splash/presentation/controller/splash_controller.dart';

import '../../../config/resoureces/my_color.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset("assets/images/logo.png",  ),
            ),
            GetBuilder<SplashController>(
              builder: (context) {
                return Positioned(
                  bottom: controller.isConnected ? 30 : 15,
                  right: 20,
                  left: 20,
                  child: controller.isConnected
                      ? const MyLoading()
                      : MyButton(
                          onTap: () => controller.checkInternet(),
                          title: 'error_no_internet'.tr,
                          expanded: true,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
