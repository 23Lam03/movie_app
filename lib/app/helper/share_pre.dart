import 'package:shared_preferences/shared_preferences.dart';

class SharePre {
  static Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    // getString laf pahi co return
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(key);
    return data ?? '';
  }

  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
