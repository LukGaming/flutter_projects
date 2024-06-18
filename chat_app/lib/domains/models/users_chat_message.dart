// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/domains/models/message.dart';

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

  UsersChatMessage copyWith({
    int? id,
    int? sentFromUserId,
    int? sentToUserId,
    List<Message>? messages,
  }) {
    return UsersChatMessage(
      id: id ?? this.id,
      sentFromUserId: sentFromUserId ?? this.sentFromUserId,
      sentToUserId: sentToUserId ?? this.sentToUserId,
      messages: messages ?? this.messages,
    );
  }
}
