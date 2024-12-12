import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

dynamic myCheckTheme(BuildContext? context,dynamic themeDark, dynamic themeLight) {
  return context!.isDarkMode ? themeDark : themeLight;
}