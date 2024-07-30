abstract class LocalStorageService {
  void set<T>(String key, T? value);

  T? get<T>(String key);
}
