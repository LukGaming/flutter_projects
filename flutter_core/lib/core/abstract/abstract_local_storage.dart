abstract class ILocalStorage {
  Future<void> setItem(String key, String value);
  Future<String> getItem(String key);
  Future<void> clearItem(String key);
  Future<void> clearStorage();
}
