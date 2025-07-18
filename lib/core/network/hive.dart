import 'package:hive_flutter/adapters.dart';

class HiveHelper {
  static init() async {
    await Hive.initFlutter();
  }

  static Future<void> saveData<T>(String key, T data) async {
    var box = await Hive.openBox<T>(key);
    await box.put('data', data);
  }

  static Future<T?> getData<T>(String key) async {
    var box = await Hive.openBox<T>(key);
    return box.get('data');
  }
}
