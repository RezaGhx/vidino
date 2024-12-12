import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/space.dart';

class MyBackground extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final bool isExpanded;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const MyBackground({
    super.key,
    this.child,
    this.color,
    this.isExpanded = false,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: isExpanded ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: color ?? context.theme.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            margin: margin ??
                const EdgeInsets.only(right: 15, left: 15, bottom: 15),
            padding: padding ?? const EdgeInsets.all(15),
            child: child,
          ),
        ),
        MediaQuery.viewInsetsOf(context).bottom.heightSpace,
      ],
    );
  }
}
