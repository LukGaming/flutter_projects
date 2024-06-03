import 'package:chat_app/domains/entities/message_entity.dart';
import 'package:chat_app/domains/entities/user_chat_messages_entity.dart';
import 'package:chat_app/infrastructure/dto/users_chat_message.dart';

abstract class IMessageRepository {
  Future<MessageEntity> save(MessageEntity message);
  Future<List<MessageEntity>> getMessagesFromUsersChat(
      UsersChatMessageEntity userChatMessageEntity);
}
