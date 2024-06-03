import 'package:chat_app/domains/entities/message_entity.dart';
import 'package:chat_app/domains/entities/user_chat_messages_entity.dart';
import 'package:chat_app/domains/repositories/message_repository.dart';
import 'package:chat_app/objectbox.g.dart';

class MessageRepository implements IMessageRepository {
  final Box<MessageEntity> messageBox;

  MessageRepository(this.messageBox);

  @override
  Future<MessageEntity> save(MessageEntity message) async {
    return messageBox.putAndGetAsync(message);
  }

  @override
  Future<List<MessageEntity>> getMessagesFromUsersChat(
    UsersChatMessageEntity userChatMessageEntity,
  ) async {
    var query = messageBox
        .query(MessageEntity_.sendFromUserId
                .equals(userChatMessageEntity.sentFromUserId) &
            MessageEntity_.sendToUserId
                .equals(userChatMessageEntity.sentToUserId))
        .build();
    return query.find();
  }
}
