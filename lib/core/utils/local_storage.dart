import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> saveData(
      {required String key, required dynamic value}) async {
    await _box.write(key, value);
  }

  static String readData({required String key}) {
    return _box.read<String>(key) ?? '';
  }

  static Future<void> deleteData({required String key}) async {
    await _box.remove(key);
  }

  static Future<void> clearAll() async {
    await _box.erase();
  }
}
