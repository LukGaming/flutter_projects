import 'package:chat_app/infrastructure/entities/message_entity.dart';
import 'package:chat_app/infrastructure/entities/user_chat_messages_entity.dart';

abstract class IMessageRepository {
  Future<MessageEntity> save(MessageEntity message);
  Future<List<MessageEntity>> getMessagesFromUsersChat(
      UsersChatMessageEntity userChatMessageEntity);
}
