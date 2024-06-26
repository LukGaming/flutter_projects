import 'package:flutter_core/core/abstract/abstract_local_storage.dart';
import 'package:localstorage/localstorage.dart';

class LocalStorageImp implements ILocalStorage {
  @override
  Future<void> clearItem(String key) async {
    localStorage.removeItem(key);
  }

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
