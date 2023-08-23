import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'storage_service.dart';

class StorageService implements IStorageService {

  final SharedPreferences _preferences;

  StorageService(this._preferences);

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future setBool(String key, bool? value) async {
    if (value == null) {
      return remove(key);
    }
    return _preferences.setBool(key, value);
  }

  @override
  Future setInt(String key, int? value) async {
    if (value == null) {
      return remove(key);
    }
    return _preferences.setInt(key, value);
  }

  @override
  Future setString(String key, String? value) async {
    if (value == null) {
      return remove(key);
    }
    return _preferences.setString(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    return _preferences.remove(key);
  }

  @override
  Future<bool> clearAll() async {
    return _preferences.clear();
  }
}
