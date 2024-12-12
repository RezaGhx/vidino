import 'dart:async';
import 'package:competition/config/constants/constans.dart';
import 'package:competition/core/utils/local_storage.dart';

class AuthStorage {
  static String tokenParams = '';

  static Future<void> saveData({required String newTokenParams}) async {
    await LocalStorage.saveData(key: MyConstants.token, value: newTokenParams);
    tokenParams = newTokenParams;
  }

  static Future<void> deleteData() async {
    await LocalStorage.deleteData(key: MyConstants.token);
    tokenParams = '';
  }

  static void loadData() {
    tokenParams = LocalStorage.readData(key: MyConstants.token);
  }

  static bool isLogin() {
    return tokenParams.isNotEmpty;
  }
}
