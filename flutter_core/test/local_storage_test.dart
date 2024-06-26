import 'package:flutter/widgets.dart';
import 'package:flutter_core/core/abstract/abstract_local_storage.dart';
import 'package:flutter_core/core/exceptions/local_storage_exceptions.dart';
import 'package:flutter_core/core/infra/local_storage_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_storage_test.mocks.dart';

// Altere o caminho conforme necessário
@GenerateMocks([ILocalStorage])
void main() {
  late LocalStorageImp localStorage;
  late MockILocalStorage mockLocalStorage;

  setUp(() {
    mockLocalStorage = MockILocalStorage();
    localStorage = LocalStorageImp();
  });

  group('LocalStorageImp', () {
    test('should remove item by key', () async {
      when(mockLocalStorage.clearItem(any)).thenAnswer((_) async => {});

      verify(mockLocalStorage.clearItem('testKey')).called(1);
    });

    test('should throw StorageOperationException when removeItem fails',
        () async {
      when(mockLocalStorage.clearItem(any)).thenThrow(Exception());

      expect(
        () async => await localStorage.clearItem('testKey'),
        throwsA(isA<StorageOperationException>()),
      );
    });

    test('should clear storage', () async {
      when(mockLocalStorage.clearItem(any))
          .thenAnswer((_) async => VoidCallbackAction);

      await localStorage.clearStorage();

      verify(mockLocalStorage.clearItem(any)).called(1);
    });

    test('should throw StorageClearException when clear fails', () async {
      when(mockLocalStorage.clearItem(any)).thenThrow(Exception());

      expect(
        () async => await localStorage.clearStorage(),
        throwsA(isA<StorageClearException>()),
      );
    });

    test('should get item by key', () async {
      when(mockLocalStorage.getItem(any)).thenAnswer((_) async => 'testValue');

      final value = await localStorage.getItem('testKey');

      expect(value, 'testValue');
    });

    test('should throw ItemNotFoundException when item is not found', () async {
      when(mockLocalStorage.getItem(any))
          .thenAnswer((_) async => await Future.value());

      expect(
        () async => await localStorage.getItem('testKey'),
        throwsA(isA<ItemNotFoundException>()),
      );
    });

    test('should throw StorageOperationException when getItem fails', () async {
      when(mockLocalStorage.getItem(any)).thenThrow(Exception());

      expect(
        () async => await localStorage.getItem('testKey'),
        throwsA(isA<StorageOperationException>()),
      );
    });

    test('should set item by key', () async {
      when(mockLocalStorage.setItem(any, any)).thenAnswer((_) async => {});

      await localStorage.setItem('testKey', 'testValue');

      verify(mockLocalStorage.setItem('testKey', 'testValue')).called(1);
    });

    test('should throw StorageOperationException when setItem fails', () async {
      when(mockLocalStorage.setItem(any, any)).thenThrow(Exception());

      expect(
        () async => await localStorage.setItem('testKey', 'testValue'),
        throwsA(isA<StorageOperationException>()),
      );
    });
  });
}
