import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  read(String texto);
  remove(String key);
  save(String key, dynamic value);
}

class SharedPref implements ILocalStorage {
  Future read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  void remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  void save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    }

    if (value is int) {
      prefs.setInt(key, value);
    }

    if (value is bool) {
      prefs.setBool(key, value);
    }

    if (value is double) {
      prefs.setDouble(key, value);
    }

    if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }
}
