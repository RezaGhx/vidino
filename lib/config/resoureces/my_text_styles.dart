import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/core/utils/my_check_theme.dart';
import 'package:flutter/material.dart';
import '../constants/constans.dart';

class MyTextStyle {

  const MyTextStyle._();

  static TextStyle style({
    required BuildContext? context,
    Color? mode,
    required MyFontSize? size,
    required MyFontWeight? weight,
    TextDecoration? textDecoration,
    double? wordSpacing,
    double? textSize,
    List<Shadow>? shadow,
  }) {
    return TextStyle(
        color: mode??myCheckTheme(context,MyColor.white, MyColor.black),
        fontSize: textSize??MyFontSize.size[size],
        fontWeight: MyFontWeight.weight[weight],
        fontFamily: MyConstants.nameFont,
        decoration: textDecoration,
        shadows: shadow,
        wordSpacing: wordSpacing);
  }
}

enum MyFontSize {
  xSmall,
  small,
  medium,
  large;
  static Map<MyFontSize, double> get size => {
    MyFontSize.xSmall: 10,
    MyFontSize.small: 12,
    MyFontSize.medium: 16,
    MyFontSize.large: 20,
  };
}

enum MyFontWeight {
  bold,
  normal;
  static Map<MyFontWeight, FontWeight> get weight => {
    MyFontWeight.bold: FontWeight.w700,
    MyFontWeight.normal: FontWeight.w400,
  };
}