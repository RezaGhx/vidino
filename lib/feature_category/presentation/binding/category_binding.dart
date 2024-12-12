import 'package:competition/feature_category/presentation/controller/category_controller.dart';
import 'package:get/get.dart';

import '../../../feature_home/data/datasource/home_datasource.dart';
import '../../../feature_home/data/repository_impl/home_repository_impl.dart';
import '../../../feature_home/domain/repository/home_repository.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/list_item_media_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<IHomeDatasource>(HomeDatasourceImpl(Get.find()));
    Get.put<IHomeRepository>(HomeRepositoryImpl(Get.find()));
    Get.put<GetProfileUseCase>(GetProfileUseCase(Get.find()));
    Get.put<ProfileUpdateUseCase>(ProfileUpdateUseCase(Get.find()));
    Get.put<ProfileUpdateUseCase>(ProfileUpdateUseCase(Get.find()));
    Get.put<ListItemMediaUseCase>(ListItemMediaUseCase(Get.find()));
    Get.put<CategoryController>(CategoryController(Get.find(),Get.find(),Get.find()));
  }
}