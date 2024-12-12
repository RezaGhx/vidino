import 'package:competition/feature_chat/domin/usecase/get_recent_usecase.dart';
import 'package:competition/feature_chat/presentation/controller/chat_history_controller.dart';
import 'package:get/get.dart';

import '../../data/datasource/local/database.dart';
import '../../data/datasource/local/list_chat_dao.dart';
import '../../data/datasource/remote/chat_datasource.dart';
import '../../data/repository_impl/home_repository_impl.dart';
import '../../domin/repository/chat_repository.dart';

class ChatHistoryBinding extends Bindings{
  @override
  void dependencies() async{


    Get.put<IChatDatasource>(ChatDatasourceImpl(Get.find()));
    Get.put<IChatRepository>(ChatRepositoryImpl(Get.find(),Get.find()));
    Get.put<GetRecentUseCase>(GetRecentUseCase(Get.find()));
   Get.put<ChatHistoryController>(ChatHistoryController(Get.find()),);
  }
}