import 'package:competition/feature_chat/domin/usecase/chat_usecase.dart';
import 'package:competition/feature_chat/presentation/controller/chat_controller.dart';
import 'package:get/get.dart';

import '../../data/datasource/local/database.dart';
import '../../data/datasource/local/list_chat_dao.dart';
import '../../data/datasource/remote/chat_datasource.dart';
import '../../data/repository_impl/home_repository_impl.dart';
import '../../domin/repository/chat_repository.dart';

class ChatBinding extends Bindings{
  @override
  void dependencies() async{
    // ساخت دیتابیس
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();

    // ثبت دیتابیس و DAO‌ها در GetX
    Get.put<AppDatabase>(database, permanent: true);
    Get.put<ListChatDao>(database.liiChatDao, permanent: true);
    Get.put<IChatDatasource>(ChatDatasourceImpl(Get.find()));
    Get.put<IChatRepository>(ChatRepositoryImpl(Get.find(),Get.find()));
    Get.put<ChatUseCase>(ChatUseCase(Get.find()));
    Get.put<ChatController>(ChatController(Get.find()));
  }
}