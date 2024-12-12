import 'package:competition/core/utils/my_check_theme.dart';
import 'package:flutter/material.dart';
import 'package:competition/config/resoureces/my_color.dart';

class MyIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final double? iconSize;
  final double? iconWeight;
  final Color? iconColor;

  const MyIconButton({super.key, this.onTap, this.icon, this.iconSize, this.iconColor, this.iconWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor??myCheckTheme(context,MyColor.white, MyColor.black),
      ),
    );
  }
}
