import 'package:chat_app/infrastructure/entities/message_file_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class MessageEntity {
  @Id()
  int? id;
  int sendToUserId;
  int sendFromUserId;
  String bodyText;
  ToMany<MessageFileEntity> messageFiles;
  DateTime cratedAt;
  bool isSent;
  bool received;
  bool seen;
  MessageEntity({
    required this.id,
    required this.sendToUserId,
    required this.sendFromUserId,
    required this.bodyText,
    required this.messageFiles,
    required this.cratedAt,
    required this.isSent,
    required this.received,
    required this.seen,
  });

  String printMessageStatus() {
    return "isSent: $isSent, isReceived: $received, seen: $seen";
  }

  MessageEntity notSentMessageCopyWith() {
    return MessageEntity(
      id: id,
      sendToUserId: sendToUserId,
      sendFromUserId: sendFromUserId,
      bodyText: bodyText,
      messageFiles: messageFiles,
      cratedAt: cratedAt,
      isSent: false,
      received: false,
      seen: false,
    );
  }

  MessageEntity sentMessageCopyWith() {
    return MessageEntity(
      id: id,
      sendToUserId: sendToUserId,
      sendFromUserId: sendFromUserId,
      bodyText: bodyText,
      messageFiles: messageFiles,
      cratedAt: cratedAt,
      isSent: true,
      received: false,
      seen: false,
    );
  }

  MessageEntity receivedMessageCopyWith() {
    return MessageEntity(
      id: id,
      sendToUserId: sendToUserId,
      sendFromUserId: sendFromUserId,
      bodyText: bodyText,
      messageFiles: messageFiles,
      cratedAt: cratedAt,
      isSent: true,
      received: true,
      seen: false,
    );
  }

  MessageEntity seenMessageCopyWith() {
    return MessageEntity(
      id: id,
      sendToUserId: sendToUserId,
      sendFromUserId: sendFromUserId,
      bodyText: bodyText,
      messageFiles: messageFiles,
      cratedAt: cratedAt,
      isSent: true,
      received: true,
      seen: true,
    );
  }
}
