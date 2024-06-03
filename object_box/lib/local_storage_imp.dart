import 'package:localstorage/localstorage.dart';
import 'package:object_box/abstract_localstorage.dart';

class LocalStorageImp implements ILocalStorage {
  @override
  Future<void> clearStorage() async {
    localStorage.clear();
  }

  @override
  Future<String> getItem(String key) async {
    return localStorage.getItem(key)!;
  }

  @override
  Future<void> setItem(String key, String value) async {
    localStorage.setItem(key, value);
  }
}
