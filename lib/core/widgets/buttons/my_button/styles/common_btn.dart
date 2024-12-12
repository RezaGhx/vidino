import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_type.dart';
import 'package:competition/core/widgets/loading/my_button_loading.dart';

class CommonBtn extends StatelessWidget {
  const CommonBtn({
    super.key,
    this.onTap,
    required this.type,
    required this.expanded,
    required this.size,
    this.icon,
    required this.title,
    required this.isLoading,
  });

  final void Function()? onTap;
  final MyButtonType type;
  final bool expanded;
  final MyButtonSize size;
  final IconData? icon;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: MyButtonType.foregroundColor(context)[type],
        backgroundColor: MyButtonType.backgroundColor(context)[type],
        disabledForegroundColor: MyButtonType.foregroundColor(context)[type],
        disabledBackgroundColor: MyButtonType.backgroundColor(context)[type],
        disabledIconColor: MyButtonType.foregroundColor(context)[type],
        fixedSize:
            expanded ? MyButtonSize.expandedSize[size] : MyButtonSize.size[size],
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: MyButtonType.border(context)[type] ?? BorderSide.none,
        ),
        textStyle: MyTextStyle.style(context: context, size: MyFontSize.small, weight: MyFontWeight.bold),
      ),
      child: isLoading ?  MyButtonLoading(
        size: MyButtonSize.iconSize[size] ?? 12,
        color: MyButtonType.foregroundColor(context)[type] ?? MyColor.white,
      ) :  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: MyButtonSize.iconSize[size],
                  ),
                4.0.widthSpace,
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      // style: MyTextStyle.style(context: context,
                      //     mode: MyButtonType.foregroundColor(context)[type],
                      //     size: MyFontSize.medium, weight: MyFontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
