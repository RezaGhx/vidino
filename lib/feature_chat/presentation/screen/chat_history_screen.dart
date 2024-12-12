import 'package:competition/core/widgets/app_bar/my_app_bar.dart';
import 'package:competition/core/widgets/buttons/my_icon_back.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/chat_history_controller.dart';
import '../widget/item_recent.dart';

class ChatHistoryScreen extends GetView<ChatHistoryController> {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "تاریخچه چت",
        leading: const MyIconBack(),
      ),
      body: controller.obx(
            (state) =>GridView.builder(
              itemCount: state!.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // for (var innerList in listChat[0].listChatRaw) {
                //   for (var chat in innerList) {
                //     print('Role: ${chat.role}, Content: ${chat.content}');
                //   }
                // }
                return ItemRecent(
                  listChatEntity: state[index],
                );
              },
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                  mainAxisExtent: 215,
                  crossAxisSpacing: 10
              ),
            ),
        onLoading: const Center(child: MyLoading()),
      ),

    );
  }
}
