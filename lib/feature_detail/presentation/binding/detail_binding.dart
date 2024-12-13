import 'package:competition/feature_detail/domin/usecase/comments_send_usecase.dart';
import 'package:competition/feature_detail/domin/usecase/comments_summary_usecase.dart';
import 'package:competition/feature_detail/domin/usecase/dislike_usecase.dart';
import 'package:competition/feature_detail/domin/usecase/like_usecase.dart';
import 'package:competition/feature_detail/presentation/controller/detail_controller.dart';
import 'package:get/get.dart';

import '../../../feature_home/data/datasource/home_datasource.dart';
import '../../../feature_home/data/repository_impl/home_repository_impl.dart';
import '../../../feature_home/domain/repository/home_repository.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/list_item_media_usecase.dart';
import '../../../feature_home/domain/usecase/media_by_id_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';
import '../../data/datasource/detail_datasource.dart';
import '../../data/repository_impl/detail_repository_impl.dart';
import '../../domin/repository/detail_repository.dart';
import '../../domin/usecase/comments_usecase.dart';
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
    Get.put<MediaByIdUseCase>(MediaByIdUseCase(Get.find()));
    Get.put<MediaSuggestUseCase>(MediaSuggestUseCase(Get.find()));
    Get.put<CommentsUseCase>(CommentsUseCase(Get.find()));
    Get.put<CommentsSendUseCase>(CommentsSendUseCase(Get.find()));
    Get.put<CommentsSummaryUseCase>(CommentsSummaryUseCase(Get.find()));
    Get.put<LikeUseCase>(LikeUseCase(Get.find()));
    Get.put<DislikeUseCase>(DislikeUseCase(Get.find()));
    Get.put<ListItemMediaUseCase>(ListItemMediaUseCase(Get.find()));
    Get.put<DetailController>(DetailController(Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find()),);
  }
}