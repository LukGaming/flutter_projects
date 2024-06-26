import 'package:flutter_core/core/abstract/abstract_local_storage.dart';
import 'package:flutter_core/core/exceptions/local_storage_exceptions.dart';
import 'package:localstorage/localstorage.dart';

class LocalStorageImp implements ILocalStorage {
  @override
  Future<void> clearItem(String key) async {
    try {
      localStorage.removeItem(key);
    } catch (e) {
      throw StorageOperationException('clearItem');
    }
  }

  @override
  Future<void> clearStorage() async {
    try {
      localStorage.clear();
    } catch (e) {
      throw StorageClearException();
    }
  }

  @override
  Future<String> getItem(String key) async {
    try {
      final item = localStorage.getItem(key);
      if (item == null) {
        throw ItemNotFoundException(key);
      }
      return item;
    } catch (e) {
      throw StorageOperationException('getItem');
    }
  }

  @override
  Future<void> setItem(String key, String value) async {
    try {
      localStorage.setItem(key, value);
    } catch (e) {
      throw StorageOperationException('setItem');
    }
  }
}
