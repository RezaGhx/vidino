import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/app_bar/my_app_bar.dart';
import 'package:competition/core/widgets/back_ground/my_background.dart';
import 'package:competition/core/widgets/buttons/my_icon_back.dart';
import 'package:competition/feature_chat/presentation/controller/chat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/resoureces/my_text_styles.dart';
import '../../../core/utils/my_check_theme.dart';
import '../../../core/widgets/buttons/my_icon_button.dart';
import '../../../core/widgets/containers/my_container_public.dart';
import '../../../core/widgets/loading/my_loading.dart';
import '../../../core/widgets/text/my_text_field.dart';
import '../widget/item_chat.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'کمک با چت',
        leading: const MyIconBack(),
      ),
      bottomNavigationBar: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: MyContainerPublic(
          backgroundColor: context.theme.neaDarkFc,
          padding: EdgeInsets.symmetric(
              vertical: 15.responseHeight, horizontal: 15.responseWidth),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: MyTextField(
            controller: controller.sendController,
            // focusNode: sendFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            borderColor: MyColor.transparent,
            heightPadding: 15,
            focusedBorderColor: MyColor.transparent,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: 'Ask your question here...',
            labelText: 'Ask your question here..',
            textAlign: TextAlign.left,
            style: MyTextStyle.style(
                context: context,
                size: MyFontSize.medium,
                weight: MyFontWeight.normal),
            onChange: (value) async {
              controller.updateMessage();
            },
            readOnly: controller.baseStatus is BaseLoading,
            suffixIcon: controller.baseStatus is! BaseLoading &&
                    controller.sendController.text.isEmpty
                ? const SizedBox()
                : MyIconButton(
                    onTap: () => controller.repSend(),
                    icon: controller.baseStatus is BaseLoading
                        ? CupertinoIcons.pause_circle_fill
                        : CupertinoIcons.arrow_up_circle_fill,
                    iconColor:
                        myCheckTheme(context, MyColor.neaDarkFc, MyColor.primary),
                    iconSize: 40,
                  ),
          ),
        ),
      ),
      body: MyBackground(
        color: MyColor.transparent,
        child: controller.obx(
          (state) => ListView.builder(
            controller: controller.scrollController,
            // اتصال ScrollController به ListView
            itemCount: state!.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ItemChat(
                chatEntity: state[index],
                onDelete: () {
                  controller.deleteItem(index: index);
                },
              );
            },
          ),
          onLoading: const Center(child: MyLoading()),
        ),
      ),
    );
  }
}
