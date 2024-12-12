import 'dart:async';

import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/resoureces/my_color.dart';
import '../../../config/resoureces/my_text_styles.dart';
import '../../../core/utils/check_persian_text.dart';
import '../../../core/utils/my_check_theme.dart';
import '../../../core/widgets/buttons/my_icon_button.dart';
import '../../../core/widgets/shimmer/my_shimmer.dart';
import '../../../core/widgets/text/my_read_more_text.dart';
import '../../domin/entity/chat_entity.dart';

class ItemChat extends StatefulWidget {
  final List<ChatEntity>? chatEntity;
  final Function()? onDelete;
  const ItemChat({super.key, this.chatEntity, this.onDelete});

  @override
  State<ItemChat> createState() => _ItemChatState();
}

class _ItemChatState extends State<ItemChat> {
  IconData iconCopy = Icons.copy;
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return MyContainerPublic(
      backgroundColor: context.theme.backgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10.responseHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyContainerPublic(
            backgroundColor:
                myCheckTheme(context, MyColor.neaDarkFc, MyColor.primary),
            padding: const EdgeInsets.all(5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Row(
              textDirection: widget.chatEntity!.isNotEmpty &&
                      isTextPersian(widget.chatEntity![0].content!)
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/images/profile.png",
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
                10.responseWidth.widthSpace,
                widget.chatEntity!.isEmpty
                    ? MyShimmer(
                        child: Container(
                          width: 80,
                          height: 20,
                          color: context.theme.neaDarkFc,
                        ),
                      )
                    : Text(
                        widget.chatEntity![0].content ?? "",
                        textDirection: widget.chatEntity!.isNotEmpty &&
                                isTextPersian(
                                    widget.chatEntity![0].content ?? "")
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: MyTextStyle.style(
                            mode: MyColor.white,
                            context: context,
                            size: MyFontSize.medium,
                            weight: MyFontWeight.bold),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  textDirection: widget.chatEntity!.isNotEmpty &&
                          isTextPersian(widget.chatEntity![1].content!)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 40.0,
                        width: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    widget.chatEntity!.isEmpty
                        ? MyShimmer(
                            child: Container(
                              width: 80,
                              height: 20,
                              color: context.theme.neaDarkFc,
                            ),
                          )
                        : Expanded(
                            child: MyReadMoreText(
                             text:  widget.chatEntity![1].content ?? "",
                              textDirection: isTextPersian(
                                      widget.chatEntity![1].content ?? "")
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              style: MyTextStyle.style(
                                  context: context,
                                  size: MyFontSize.medium,
                                  weight: MyFontWeight.bold),
                            ),
                          )
                  ],
                ),
                15.responseHeight.heightSpace,
                Row(
                  textDirection: widget.chatEntity!.isNotEmpty &&
                          isTextPersian(widget.chatEntity![1].content!)
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    5.responseWidth.widthSpace,
                    MyIconButton(
                      icon: iconCopy,
                      onTap: () async {
                        setState(() {
                          iconCopy = Icons.check;
                        });


                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(const Duration(seconds: 1), () async{
                          await Clipboard.setData(ClipboardData(
                              text: widget.chatEntity![1].content!));
                          setState(() {

                            iconCopy = Icons.copy;
                          });
                        });
                        // copied successfully
                      },
                      iconColor: MyColor.neaDarkFc,
                    ),
                    5.responseWidth.widthSpace,
                    MyIconButton(
                      icon: Icons.delete_outlined,
                      onTap: widget.onDelete!,
                      iconColor: MyColor.neaDarkFc,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
