import 'package:chat_app/infrastructure/entities/message_file_entity.dart';
import 'package:chat_app/domains/models/message_file.dart';

class MessageFileMapper {
  static MessageFileEntity toEntity(MessageFile messageFile) {
    return MessageFileEntity(
      id: messageFile.id,
      serverSrc: messageFile.serverSrc,
      downloadedToLocalStorage: messageFile.downloadedToLocalStorage,
      localStoragePath: messageFile.localStoragePath,
      messageId: messageFile.messageId,
      sentToServer: messageFile.sentToServer,
    );
  }

  static MessageFile toMessageFile(MessageFileEntity messageFile) {
    return MessageFile(
      id: messageFile.id,
      serverSrc: messageFile.serverSrc,
      downloadedToLocalStorage: messageFile.downloadedToLocalStorage,
      localStoragePath: messageFile.localStoragePath,
      messageId: messageFile.messageId,
      sentToServer: messageFile.sentToServer,
    );
  }
}
