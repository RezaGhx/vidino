import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/device_size.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import '../../../../config/resoureces/my_text_styles.dart';
import '../../buttons/my_button/my_button.dart';
import '../../containers/my_container_public.dart';

class MyDialogConfirm extends StatelessWidget {
  final void Function()? onTap;
  final String? title;

  const MyDialogConfirm({super.key, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return MyContainerPublic(
      padding: EdgeInsets.zero,

      margin: EdgeInsets.symmetric(
        horizontal: 15.responseWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.widthDevice,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 14.responseHeight,
              horizontal: 16.responseWidth,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),

            ),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.bold),
            ),
          ),
          15.responseHeight.heightSpace,
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyButton(
                    title: 'exit'.tr,
                    onTap: onTap,
                    expanded: true,
                    size: MyButtonSize.small,
                    type: MyButtonType.btnCancel,
                  ),
                ),
                15.responseWidth.widthSpace,
                MyButton(
                  title: 'close'.tr,
                  onTap: ()=>Get.back(),
                  size: MyButtonSize.small,
                  type: MyButtonType.btnDefaultNonLine,
                ),
              ],
            ),
          ),
          15.responseHeight.heightSpace,
        ],
      ),
    );
  }
}
