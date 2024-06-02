import 'package:chat_app/domains/entities/message_entity.dart';
import 'package:chat_app/infrastructure/dto/message.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UsersChatMessageEntity {
  @Id()
  int id;
  int sentFromUserId;
  int sentToUserId;
  ToMany<MessageEntity> messages;
  UsersChatMessageEntity({
    required this.id,
    required this.messages,
    required this.sentFromUserId,
    required this.sentToUserId,
  });
}
