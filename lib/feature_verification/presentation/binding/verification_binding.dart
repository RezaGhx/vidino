import 'package:get/get.dart';
import 'package:competition/feature_login/data/datasource/login_datasource.dart';
import 'package:competition/feature_login/data/repository_impl/login_repository_impl.dart';
import 'package:competition/feature_login/domain/repository/login_repository.dart';
import 'package:competition/feature_login/domain/usecase/login_usecase.dart';
import 'package:competition/feature_verification/data/datasource/verify_code_datasource.dart';
import 'package:competition/feature_verification/data/repository_impl/verify_code_repository_impl.dart';
import 'package:competition/feature_verification/domain/repository/verify_code_reporsitory.dart';
import 'package:competition/feature_verification/domain/usecase/verify_code_usecase.dart';
import 'package:competition/feature_verification/presentation/controller/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IVerifyCodeDatasource>(VerifyCodeDatasourceImpl(Get.find()));
    Get.put<ILoginDatasource>(LoginDatasourceImpl(Get.find()));
    Get.put<IVerifyCodeRepository>(VerifyCodeRepositoryImpl(Get.find()));
    Get.put<ILoginRepository>(LoginRepositoryImpl(Get.find()));
    Get.put<VerifyCodeUseCase>(VerifyCodeUseCase(Get.find()));
    Get.put<LoginUseCase>(LoginUseCase(Get.find()));
    Get.put<VerificationController>(VerificationController(Get.find(), Get.find()));
  }
}
