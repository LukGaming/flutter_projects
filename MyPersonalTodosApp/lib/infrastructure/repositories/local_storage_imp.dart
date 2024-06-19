import 'package:localstorage/localstorage.dart';
import 'package:object_box/infrastructure/repositories/ilocal_storage.dart';

class LocalStorageImp implements ILocalStorage {
  @override
  Future<void> clear() async {
    localStorage.clear();
  }

  @override
  Future<String> getItem(String key) async {
    final String? item = localStorage.getItem(key);
    if (item != null) return item;
    throw Exception("Local storage Item not found");
  }

  @override
  Future<void> setItem(String key, String value) async {
    localStorage.setItem(key, value);
  }
}
