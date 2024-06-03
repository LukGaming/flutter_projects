import 'package:chat_app/domains/entities/message_entity.dart';
import 'package:chat_app/domains/entities/user_chat_messages_entity.dart';
import 'package:chat_app/infrastructure/dto/message.dart';
import 'package:chat_app/infrastructure/dto/users_chat_message.dart';
import 'package:chat_app/infrastructure/mappers/message_mapper.dart';
import 'package:chat_app/objectbox.g.dart';

class UserChatMessageMapper {
  static UsersChatMessageEntity toEntity(UsersChatMessage userChatMessage) {
    ToMany<MessageEntity> entities = ToMany();
    userChatMessage.messages.forEach(
      (element) => entities.add(
        MessageMapper.toEntity(element),
      ),
    );

    return UsersChatMessageEntity(
      id: userChatMessage.id,
      messages: entities,
      sentFromUserId: userChatMessage.sentFromUserId,
      sentToUserId: userChatMessage.sentToUserId,
    );
  }

  static UsersChatMessage fromEntity(UsersChatMessageEntity userChatMessage) {
    List<Message> entities = userChatMessage.messages
        .map((element) => MessageMapper.fromEntity(element))
        .toList();

    return UsersChatMessage(
      id: userChatMessage.id,
      messages: entities,
      sentFromUserId: userChatMessage.sentFromUserId,
      sentToUserId: userChatMessage.sentToUserId,
    );
  }
}
