import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveDate(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else {
      return sharedPreferences.setBool(key, value);
    }
  }

  static Object? getDate({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
