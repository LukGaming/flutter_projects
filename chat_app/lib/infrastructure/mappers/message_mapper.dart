import 'package:chat_app/infrastructure/entities/message_entity.dart';
import 'package:chat_app/infrastructure/entities/message_file_entity.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/message_file.dart';
import 'package:chat_app/infrastructure/mappers/message_file_mapper.dart';
import 'package:objectbox/objectbox.dart';

class MessageMapper {
  static Message fromEntity(MessageEntity messageEntity) {
    List<MessageFile> messageFiles = messageEntity.messageFiles
        .map((element) => MessageFileMapper.toMessageFile(element))
        .toList();

    return Message(
      id: messageEntity.id,
      sendToUserId: messageEntity.sendToUserId,
      sendFromUserId: messageEntity.sendFromUserId,
      bodyText: messageEntity.bodyText,
      messageFiles: messageFiles,
      cratedAt: messageEntity.cratedAt,
      isSent: messageEntity.isSent,
      received: messageEntity.received,
      seen: messageEntity.seen,
    );
  }

  static MessageEntity toEntity(Message message) {
    ToMany<MessageFileEntity> messageFiles = ToMany();

    for (int i = 0; i < message.messageFiles.length; i++) {
      messageFiles.add(MessageFileMapper.toEntity(message.messageFiles[i]));
    }

    return MessageEntity(
      id: message.id,
      sendToUserId: message.sendToUserId,
      sendFromUserId: message.sendFromUserId,
      bodyText: message.bodyText,
      messageFiles: messageFiles,
      cratedAt: message.cratedAt,
      isSent: message.isSent,
      received: message.received,
      seen: message.seen,
    );
  }
}
