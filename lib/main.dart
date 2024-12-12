import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app/app.dart';
import 'core/utils/auth_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    dotenv.load(),
    GetStorage.init(),
  ]);
  AuthStorage.loadData();
  runApp(const MyApp());
}
