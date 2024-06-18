import 'package:objectbox/objectbox.dart';

@Entity()
class MessageFileEntity {
  @Id()
  int? id;
  String serverSrc;
  bool downloadedToLocalStorage;
  String? localStoragePath;
  int? messageId;
  final bool sentToServer;
  MessageFileEntity({
    required this.id,
    required this.serverSrc,
    required this.downloadedToLocalStorage,
    required this.localStoragePath,
    required this.messageId,
    required this.sentToServer,
  });
}
