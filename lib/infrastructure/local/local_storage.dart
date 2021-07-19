import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  static saveString(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
  }

  static getString(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }
}
