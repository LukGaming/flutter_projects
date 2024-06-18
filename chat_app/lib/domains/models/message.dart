import 'package:chat_app/domains/models/message_file.dart';

class Message {
  int? id;
  int sendToUserId;
  int sendFromUserId;
  String bodyText;
  List<MessageFile> messageFiles;
  DateTime cratedAt;
  bool isSent;
  bool received;
  bool seen;
  Message({
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

  Message notSentMessageCopyWith() {
    return Message(
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

  Message sentMessageCopyWith() {
    return Message(
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

  Message receivedMessageCopyWith() {
    return Message(
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

  Message seenMessageCopyWith() {
    return Message(
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
