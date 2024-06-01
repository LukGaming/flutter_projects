// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/models/message.dart';

class UsersChatMessage {
  int id;
  int user1Id;
  int user2Id;
  List<Message> messages;
  UsersChatMessage({
    required this.id,
    required this.messages,
    required this.user1Id,
    required this.user2Id,
  });
}
