// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/models/message.dart';

class UsersChatMessage {
  int id;
  int sentFromUserId;
  int sentToUserId;
  List<Message> messages;
  UsersChatMessage({
    required this.id,
    required this.messages,
    required this.sentFromUserId,
    required this.sentToUserId,
  });
}
