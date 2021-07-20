import 'package:ddd_signin/domain/core/failures/auth_failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  static saveString(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(key, value);
  }

  static getString(String key) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String? value = _prefs.getString(key);

      return value;
    } catch (e) {
      throw ServerError(failedValue: key);
    }
  }
}
