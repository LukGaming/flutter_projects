// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/models/message_file.dart';

class Message {
  int id;
  int sendToUserId;
  int sendFromUserId;
  String bodyText;
  List<MessageFile> messageFiles;
  DateTime sentTime;
  bool isSent;
  bool received;
  bool seen;
  Message({
    required this.id,
    required this.sendToUserId,
    required this.sendFromUserId,
    required this.bodyText,
    required this.messageFiles,
    required this.sentTime,
    required this.isSent,
    required this.received,
    required this.seen,
  });

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  String printMessageStatus() {
    return "isSent: ${isSent}, isReceived: ${received}, seen: ${seen}";
  }

  Message notSentMessageCopyWith() {
    return Message(
      id: id,
      sendToUserId: sendToUserId,
      sendFromUserId: sendFromUserId,
      bodyText: bodyText,
      messageFiles: messageFiles,
      sentTime: sentTime,
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
      sentTime: sentTime,
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
      sentTime: sentTime,
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
      sentTime: sentTime,
      isSent: true,
      received: true,
      seen: true,
    );
  }
}
