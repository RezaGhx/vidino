import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:get/get.dart';

import '../../config/localization/my_localization.dart';
import '../../config/resoureces/my_color.dart';
import '../../config/routes/router.dart';
import '../../config/routes/routes.dart';
import '../../config/theme/my_theme.dart';
import '../network/http_request.dart';
import '../network/http_request_impl.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    SystemUiOverlayStyle(
      systemNavigationBarColor:  context.isDarkMode?MyColor.white:MyColor.white, // رنگ نوار ناوبری
      statusBarColor: Colors.transparent, // رنگ نوار وضعیت
      systemNavigationBarIconBrightness: context.isDarkMode?Brightness.dark:Brightness.light, // رنگ آیکون‌های نوار ناوبری
      statusBarBrightness: context.isDarkMode?Brightness.dark:Brightness.light,
      statusBarIconBrightness: context.isDarkMode?Brightness.light:Brightness.dark,
    );
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: MyAppRouter.getPages(),
      initialRoute: Routes.splashPage,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeMode.dark,
      translations: MyLocalization(),
      debugShowCheckedModeBanner: false,
      locale: const Locale("fa", "IR"),
      initialBinding: BindingsBuilder(
        () {
          Get.put<IHttpRequest>(HttpRequestImpl());
        },
      ),
    );
  }
}
