import 'package:chat_app/infrastructure/dto/message.dart';

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
