import 'package:competition/core/utils/my_check_theme.dart';
import 'package:flutter/material.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:get/get.dart';

enum MyButtonType {
  btnDefault,
  btnDefaultNonLine,
  btnDefaultOutline,
  btnApprove,
  btnApproveNonLine,
  btnApproveOutline,
  btnCancel,
  btnCancelNonLine,
  btnCancelOutline,
  btnCalDefault,
  btnCalOutline,
  btnSquareOutline;

  static Map<MyButtonType, Color> backgroundColor(BuildContext context) => {
    MyButtonType.btnDefault: MyColor.primary,
    MyButtonType.btnDefaultNonLine: MyColor.transparent,
    MyButtonType.btnDefaultOutline: context.theme.backBtnDefaultColor,
    MyButtonType.btnApprove: MyColor.green,
    MyButtonType.btnApproveNonLine: context.theme.backBtnDefaultColor,
    MyButtonType.btnApproveOutline: context.theme.backBtnDefaultColor,
    MyButtonType.btnCancel: MyColor.maroon,
    MyButtonType.btnCancelNonLine: context.theme.backBtnDefaultColor,
    MyButtonType.btnCancelOutline: context.theme.backBtnDefaultColor,
    MyButtonType.btnCalDefault: MyColor.primary,
    MyButtonType.btnCalOutline: context.theme.backBtnDefaultColor,
    MyButtonType.btnSquareOutline: context.theme.backBtnDefaultColor,
  };

  static Map<MyButtonType, Color> foregroundColor(BuildContext context) => {
    MyButtonType.btnDefault: MyColor.white,
    MyButtonType.btnDefaultNonLine: myCheckTheme(context, MyColor.white, MyColor.black),
    MyButtonType.btnDefaultOutline: context.theme.backgroundColor,
    MyButtonType.btnApprove: MyColor.white,
    MyButtonType.btnApproveNonLine: MyColor.white,
    MyButtonType.btnApproveOutline: MyColor.green,
    MyButtonType.btnCancel: MyColor.white,
    MyButtonType.btnCancelNonLine: MyColor.maroon,
    MyButtonType.btnCancelOutline: MyColor.maroon,
    MyButtonType.btnCalDefault: MyColor.white,
    MyButtonType.btnCalOutline: context.theme.backgroundColor,
    MyButtonType.btnSquareOutline: context.theme.backgroundColor,
  };

  static Map<MyButtonType, BorderSide> border(BuildContext context) => {
    MyButtonType.btnDefault: BorderSide.none,
    MyButtonType.btnDefaultNonLine: BorderSide.none,
    MyButtonType.btnDefaultOutline: BorderSide(
      width: 1, color: context.theme.backgroundColor,
    ),
    MyButtonType.btnApprove: BorderSide.none,
    MyButtonType.btnApproveNonLine: BorderSide.none,
    MyButtonType.btnApproveOutline: const BorderSide(width: 1, color: MyColor.green),
    MyButtonType.btnCancel: BorderSide.none,
    MyButtonType.btnCancelNonLine: BorderSide.none,
    MyButtonType.btnCancelOutline: const BorderSide(width: 1, color: MyColor.maroon),
    MyButtonType.btnCalDefault: BorderSide.none,
    MyButtonType.btnCalOutline: BorderSide(
      width: 1, color: context.theme.backgroundColor,
    ),
    MyButtonType.btnSquareOutline: BorderSide(
      width: 1, color: context.theme.backgroundColor,
    ),
  };
}