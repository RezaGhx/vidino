import 'package:flutter/material.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_type.dart';
import 'package:competition/core/widgets/loading/my_button_loading.dart';

class SquareBtn extends StatelessWidget {
  const SquareBtn({
    super.key,
    this.onTap,
    required this.type,
    this.icon,
    required this.title,
    required this.isLoading,
  });

  final void Function()? onTap;
  final MyButtonType type;
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
        fixedSize: const Size(60, 60),
        padding: const EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: MyButtonType.border(context)[type] ?? BorderSide.none,
        ),
        textStyle: MyTextStyle.style(context: context,
          size: MyFontSize.small,
          weight: MyFontWeight.normal,
        ),
      ),
      child: isLoading ?  MyButtonLoading(
        size: 22,
        color: MyButtonType.foregroundColor(context)[type] ?? MyColor.primary,
      ) :  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 29,
            ),
          FittedBox(
              fit: BoxFit.scaleDown,child: Text(title, maxLines: 1)),
        ],
      ),
    );
  }
}
