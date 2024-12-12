import 'package:get/get.dart';
import 'package:competition/feature_login/data/datasource/login_datasource.dart';
import 'package:competition/feature_login/data/repository_impl/login_repository_impl.dart';
import 'package:competition/feature_login/domain/repository/login_repository.dart';
import 'package:competition/feature_login/domain/usecase/login_usecase.dart';
import 'package:competition/feature_login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ILoginDatasource>(LoginDatasourceImpl(Get.find()));
    Get.put<ILoginRepository>(LoginRepositoryImpl(Get.find()));
    Get.put<LoginUseCase>(LoginUseCase(Get.find()));
    Get.put<LoginController>(LoginController(Get.find()));
  }
}
