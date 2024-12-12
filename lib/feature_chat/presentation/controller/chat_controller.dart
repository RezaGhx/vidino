import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/snackbar/my_snack_bar.dart';
import 'package:competition/feature_chat/domin/usecase/chat_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/params/chat_param.dart';
import '../../domin/entity/chat_entity.dart';

class ChatController extends GetxController with StateMixin<List<List<ChatEntity>>>{
  final TextEditingController sendController = TextEditingController();
  List<List<ChatEntity>> listEntity = [];
  List<ChatParam> listParam = [];
  final ScrollController scrollController = ScrollController();

  ///Status
  BaseStatus baseStatus = const BaseInit();

  ///useCase
  ChatUseCase chatUseCase;

  ChatController(this.chatUseCase);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  void repSend() async {
    listParam.add(ChatParam(content: sendController.text, role: "user"));
    sendController.clear();

    baseStatus = const BaseLoading();
    change(null, status: RxStatus.loading());
    update();
    await chatUseCase(listParam).then(
      (value) {
        value.fold(
          (data) {
            baseStatus = BaseComplete<String>(data);
            for (int i = 0; i < listParam.length; i++) {
              if (listParam[i].role == "user" &&
                  i + 1 < listParam.length &&
                  listParam[i + 1].role == "assistant") {
                listEntity.add([
                  ChatEntity(role: listParam[i].role,content: listParam[i].content),
                  ChatEntity(role: listParam[i+1].role,content: listParam[i+1].content),]);
                i++; // از آیتم بعدی صرف نظر کن چون قبلاً به گروه اضافه شده
              }
            }
            change(listEntity, status: RxStatus.success());
            lastGoToItem();
          },
          (error) {
            baseStatus = BaseError(error.message);
            change(listEntity, status: RxStatus.error(error.message));
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

  void updateMessage() {
    update();
  }

  void lastGoToItem(){
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void deleteItem({int? index,}) {
    listEntity.removeAt(index!);
    change(listEntity, status: RxStatus.success());
    lastGoToItem();
  }
}
