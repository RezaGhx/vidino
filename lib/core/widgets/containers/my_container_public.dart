import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/utils/my_check_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/resoureces/my_color.dart';

class MyContainerPublic extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final Color borderColor;
  final double? height;
  final double? width;
  final double borderRadiusSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;

  const MyContainerPublic({
    super.key,
    this.child,
    this.backgroundColor ,
    this.borderColor = MyColor.transparent,
    this.borderRadiusSize = 10,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
    this.alignment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: backgroundColor??myCheckTheme(context, MyColor.slightlyDarker, MyColor.nearLightFb),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusSize),
          side: BorderSide(width: 1, color: borderColor),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusSize),
          child: Container(
            width: width,
            height: height,
            padding: padding ?? EdgeInsets.zero,
            alignment: alignment,
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
