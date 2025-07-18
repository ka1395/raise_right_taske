import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const languageKey = "languageKey";
  static const themeKey = "themKey";

  static late SharedPreferences pref;

  static initPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static bool getBoolean(String key) {
    return pref.getBool(key) ?? false;
  }

  static Future<void> setBoolean(String key, bool value) async {
    await pref.setBool(key, value);
  }

  static String getString(String key) {
    return pref.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await pref.setString(key, value);
  }

  static int getInt(String key) {
    return pref.getInt(key) ?? 0;
  }

  static Future<void> setInt(String key, int value) async {
    await pref.setInt(key, value);
  }

  static Future<void> clearSharPreference() async {
    await pref.clear();
  }

  static Future<void> clearKeyData(String key) async {
    await pref.remove(key);
  }

  static Future<void> cacheJsonData({
    required String key,
    required Object data,
  }) async {
    String dataEncode = jsonEncode(data);
    await Preferences.setString(key, dataEncode);
  }

  static dynamic getJsonData({required String key}) {
    String dataDecode = Preferences.getString(key);
    return jsonDecode(dataDecode);
  }
}
