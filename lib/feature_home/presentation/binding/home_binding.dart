import 'package:competition/feature_home/domain/usecase/get_profile_usecase.dart';
import 'package:competition/feature_home/domain/usecase/list_item_media_usecase.dart';
import 'package:competition/feature_home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../data/datasource/home_datasource.dart';
import '../../data/repository_impl/home_repository_impl.dart';
import '../../domain/repository/home_repository.dart';
import '../../domain/usecase/list_item_category_usecase.dart';
import '../../domain/usecase/media_by_id_usecase.dart';
import '../../domain/usecase/profile_update_usecase.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<IHomeDatasource>(HomeDatasourceImpl(Get.find()));
    Get.put<IHomeRepository>(HomeRepositoryImpl(Get.find()));
    Get.put<GetProfileUseCase>(GetProfileUseCase(Get.find()));
    Get.put<ProfileUpdateUseCase>(ProfileUpdateUseCase(Get.find()));
    Get.put<ListItemCategoryUseCase>(ListItemCategoryUseCase(Get.find()));
    Get.put<ListItemMediaUseCase>(ListItemMediaUseCase(Get.find()));
    Get.put<MediaByIdUseCase>(MediaByIdUseCase(Get.find()));
    Get.put<HomeController>(HomeController(Get.find(),Get.find(),Get.find(),Get.find(),Get.find()));
  }
}