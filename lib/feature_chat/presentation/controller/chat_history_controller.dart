import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_chat/domin/usecase/get_recent_usecase.dart';
import 'package:get/get.dart';

import '../../../core/widgets/snackbar/my_snack_bar.dart';
import '../../domin/entity/list_chat_entity.dart';

class ChatHistoryController extends GetxController with StateMixin<List<ListChatEntity>>{
  List<ListChatEntity> listChat = [];

  ///UseCase
  GetRecentUseCase getRecentUseCase;


  ChatHistoryController(this.getRecentUseCase);

  @override
  void onInit() {
    super.onInit();
  }

  void repSend() async {

    change(null, status: RxStatus.loading());
    update();
    await getRecentUseCase(NoParam()).then(
          (value) {
        value.fold(
              (data) {
                listChat=data;
            change(listChat, status: RxStatus.success());

          },
              (error) {

            change(listChat, status: RxStatus.error(error.message));
            update();
            mySnackBar(
                title: "خطایی رخ داده است",
                content: error.message,
                isSuccess: false);
          },
        );
      },
    );
  }

}