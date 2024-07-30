import 'package:shared_preferences/shared_preferences.dart';

import '../local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  LocalStorageServiceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  T? get<T>(String key) {
    try {
      final res = (_sharedPreferences.get(key) as T?);
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  void set<T>(String key, T? value) {
    if (value == null) {
      _sharedPreferences.remove(key);
      return;
    }
    if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    } else {
      throw UnsupportedError('[Storage] Unsuported type ${value.runtimeType}');
    }
  }
}
