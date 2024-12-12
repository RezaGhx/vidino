import 'package:get/get.dart';
import 'package:competition/config/routes/routes.dart';
import 'package:competition/core/utils/check_connection.dart';

class SplashController extends GetxController {
  bool isConnected = false;

  @override
  void onInit() {
    super.onInit();
    checkInternet();
  }

  Future<void> checkInternet() async {
    isConnected = true;
    update();                                 
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        CheckConnection.isConnected().then(
          (value) {
            if (value) {
              Get.offAllNamed(Routes.loginPage);
            } else {
              isConnected = false;
              update();
            }
          },
        );
      },
    );
  }
}
