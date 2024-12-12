import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:competition/config/constants/constans.dart';
import 'package:competition/config/resoureces/my_color.dart';

class MyTheme {
  const MyTheme();

  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: MyConstants.nameFont,
    primaryColor: MyColor.primary,
    scaffoldBackgroundColor: MyColor.originalLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.transparent,
      foregroundColor: MyColor.black,
      surfaceTintColor: MyColor.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: MyColor.black.withOpacity(0.05),
        statusBarIconBrightness: Brightness.dark
      ),
    ),
  );

  static final dark = ThemeData(
    fontFamily: MyConstants.nameFont,
    brightness: Brightness.dark,
    primaryColor: MyColor.primary,
    scaffoldBackgroundColor: MyColor.nearShadeDark,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.transparent,
      foregroundColor: MyColor.white,
      surfaceTintColor: MyColor.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: MyColor.black.withOpacity(0.5),
          statusBarIconBrightness: Brightness.light,
      ),
    ),
  );

  static Map<String, Color> get lightCustomColors => {
        'background_color': MyColor.white,
        'scaffold_color_grey': MyColor.nearShadeLight,
        'back_btn_default_color': MyColor.shadeLight400,
    'blur_modal': MyColor.blurModal,

  };

  static Map<String, Color> get darkCustomColors => {
        'background_color': MyColor.black,
        'scaffold_color_grey': MyColor.nearShadeDark,
        'back_btn_default_color': MyColor.shadeBlack400,
    'blur_modal': MyColor.slightlyDarker,

  };
}

extension ThemeExtension on ThemeData {
  Map<String, Color> get customColors =>
      Get.isDarkMode ? MyTheme.darkCustomColors : MyTheme.lightCustomColors;

  Color get backgroundColor => customColors['background_color'] ?? MyColor.black;
  Color get neaDarkFc => customColors['scaffold_color_grey'] ?? MyColor.nearShadeDark;
  Color get backBtnDefaultColor => customColors['back_btn_default_color'] ?? MyColor.white;
  Color get blurModal => customColors['blur_modal'] ?? MyColor.blurModal;

}
