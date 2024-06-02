// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
