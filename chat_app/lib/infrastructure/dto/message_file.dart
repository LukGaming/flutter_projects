class MessageFile {
  int id;
  String serverSrc;
  bool downloadedToLocalStorage;
  String? localStoragePath;
  int messageId;
  final bool sentToServer;
  MessageFile({
    required this.id,
    required this.serverSrc,
    required this.downloadedToLocalStorage,
    required this.localStoragePath,
    required this.messageId,
    required this.sentToServer,
  });

  @override
  String toString() {
    return 'MessageFile(id: $id, serverSrc: $serverSrc, downloadedToLocalStorage: $downloadedToLocalStorage, localStoragePath: $localStoragePath, messageId: $messageId, sentToServer: $sentToServer)';
  }
}
