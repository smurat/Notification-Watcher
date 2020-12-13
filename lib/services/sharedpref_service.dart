import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();
  SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  // call this method from iniState() function of mainApp().
  Future<SharedPreferences> initPrefs() async {
    _prefs = await _instance;
    return _prefs;
  }

  String getString(String key) {
    return _prefs.getString(key) ?? "";
  }

  Future<bool> setString(String key, String value) async {
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return prefs?.setStringList(key, value) ?? Future.value(false);
  }
}
