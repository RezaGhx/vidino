import 'package:flutter/material.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyAppBar extends PreferredSize {
  final void Function()? onPressed;
  final String? title;
  final Widget? center;
  final IconData icon;
  final TextStyle? style;
  final List<Widget>? actions;
  final Widget? leading;
  final bool designNew;
  final double? leadingWidth;
  MyAppBar({
    super.key,
    this.onPressed,
    this.title,
    this.style,
    this.center,
    this.icon = Icons.arrow_forward_rounded,
    this.actions,
    this.leading,
    this.leadingWidth = 56.0,
    this.designNew = false,
  }) : super(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor:  context.isDarkMode?MyColor.black:MyColor.white, // رنگ نوار ناوبری
        statusBarColor: Colors.transparent, // رنگ نوار وضعیت
        systemNavigationBarIconBrightness: context.isDarkMode?Brightness.dark:Brightness.light, // رنگ آیکون‌های نوار ناوبری
        statusBarBrightness: context.isDarkMode?Brightness.dark:Brightness.light,
        statusBarIconBrightness: context.isDarkMode?Brightness.light:Brightness.dark,
      ),
      centerTitle: true,
      title: title != null
          ? Text(
              title ?? '',
              style: MyTextStyle.style(context: context,
                size: MyFontSize.medium,
                weight: MyFontWeight.normal,
              ),
            )
          : Image.asset(
        'assets/images/logo.png',
        color: MyColor.primary,
        width: 80,
      ),
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      actions: actions,
      leading: leading ?? const SizedBox(),
      leadingWidth: leadingWidth,
      flexibleSpace: center,
    );
  }
}
