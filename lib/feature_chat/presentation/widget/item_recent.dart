import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/resoureces/my_color.dart';
import '../../../config/resoureces/my_text_styles.dart';
import '../../../core/utils/check_persian_text.dart';
import '../../../core/utils/my_check_theme.dart';
import '../../../core/utils/split_date_from_time.dart';
import '../../../core/widgets/containers/my_container_public.dart';
import '../../domin/entity/list_chat_entity.dart';
class ItemRecent extends StatefulWidget {
  final ListChatEntity? listChatEntity;
  const ItemRecent({super.key, this.listChatEntity});

  @override
  State<ItemRecent> createState() => _ItemRecentState();
}

class _ItemRecentState extends State<ItemRecent> {
  @override
  Widget build(BuildContext context) {
    return MyContainerPublic(
      onTap: (){
        Navigator.pop(context,widget.listChatEntity);
      },
      backgroundColor: context.theme.backgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10.responseHeight),
      child: Column(
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
              textDirection: widget.listChatEntity!.listChat.isNotEmpty &&
                  isTextPersian(widget.listChatEntity!.listChat[0][0].content!)
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
                5.responseWidth.widthSpace,
                Text(
                  widget.listChatEntity!.listChat[0][0].content ?? "",
                  textDirection: widget.listChatEntity!.listChat.isNotEmpty &&
                      isTextPersian(
                          widget.listChatEntity!.listChat[0][0].content ?? "")
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style: MyTextStyle.style(
                      mode: MyColor.white,
                      context: context,
                      size: MyFontSize.small,
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
                  textDirection: widget.listChatEntity!.listChat.isNotEmpty &&
                      isTextPersian(widget.listChatEntity!.listChat[0][1].content!)
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
                    Expanded(
                      child: Text(
                        widget.listChatEntity!.listChat[0][1].content ?? "",
                        textDirection: isTextPersian(
                            widget.listChatEntity!.listChat[0][1].content ?? "")
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis, // نمایش ... در انتها
                        style: MyTextStyle.style(
                            context: context,
                            size: MyFontSize.small,
                            weight: MyFontWeight.bold),
                      ),
                    )
                  ],
                ),
                5.responseHeight.heightSpace,
                Divider(color: MyColor.neaDarkFc,),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time_sharp),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            extractDateTime(widget.listChatEntity!.dateTimeCreate),
                            textDirection:  TextDirection.ltr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis, // نمایش ... در انتها
                            style: MyTextStyle.style(
                                context: context,
                                mode: MyColor.neaDarkFc,
                                size: MyFontSize.small,
                                weight: MyFontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    !widget.listChatEntity!.dateTimeCreate.contains(widget.listChatEntity!.dateTimeUpdate)?SizedBox(): Row(
                      children: [
                        Icon(Icons.update_outlined),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            extractDateTime(widget.listChatEntity!.dateTimeUpdate),
                            textDirection:  TextDirection.ltr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis, // نمایش ... در انتها
                            style: MyTextStyle.style(
                                context: context,
                                mode: MyColor.neaDarkFc,
                                size: MyFontSize.small,
                                weight: MyFontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
