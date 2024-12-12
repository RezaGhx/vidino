import 'package:competition/feature_detail/presentation/controller/detail_controller.dart';
import 'package:get/get.dart';

import '../../../feature_home/data/datasource/home_datasource.dart';
import '../../../feature_home/data/repository_impl/home_repository_impl.dart';
import '../../../feature_home/domain/repository/home_repository.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';
import '../../data/datasource/detail_datasource.dart';
import '../../data/repository_impl/detail_repository_impl.dart';
import '../../domin/repository/detail_repository.dart';
import '../../domin/usecase/media_suggest_usecase.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<IHomeDatasource>(HomeDatasourceImpl(Get.find()));
    Get.put<IHomeRepository>(HomeRepositoryImpl(Get.find()));
    Get.put<IDetailDatasource>(DetailDatasourceImpl(Get.find()));
    Get.put<IDetailRepository>(DetailRepositoryImpl(Get.find()));
    Get.put<GetProfileUseCase>(GetProfileUseCase(Get.find()));
    Get.put<ProfileUpdateUseCase>(ProfileUpdateUseCase(Get.find()));
    Get.put<MediaSuggestUseCase>(MediaSuggestUseCase(Get.find()));
    Get.put<DetailController>(DetailController(Get.find(),Get.find(),Get.find()));
  }
}