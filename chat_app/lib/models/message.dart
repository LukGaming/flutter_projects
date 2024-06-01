// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/models/message_file.dart';

class Message {
  int id;
  int sendToUserId;
  int sendFromUserId;
  String bodyText;
  List<MessageFile> messageFiles;
  DateTime sentTime;
  Message({
    required this.id,
    required this.sendToUserId,
    required this.sendFromUserId,
    required this.bodyText,
    required this.messageFiles,
    required this.sentTime,
  });
}
