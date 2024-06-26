class LocalStorageException implements Exception {
  final String message;
  LocalStorageException(this.message);

  @override
  String toString() => 'LocalStorageException: $message';
}

class ItemNotFoundException extends LocalStorageException {
  ItemNotFoundException(String key) : super('Item not found for key: $key');
}

class StorageClearException extends LocalStorageException {
  StorageClearException() : super('Failed to clear storage.');
}

class StorageOperationException extends LocalStorageException {
  StorageOperationException(String operation)
      : super('Failed to perform operation: $operation.');
}
