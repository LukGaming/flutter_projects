import 'package:chat_app/infrastructure/entities/message_entity.dart';
import 'package:chat_app/domains/repositories/message_repository.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';
import 'package:chat_app/infrastructure/mappers/message_mapper.dart';
import 'package:chat_app/infrastructure/mappers/user_chat_message_mapper.dart';

abstract class IMessageService {
  Future<Message> saveMessage(Message message);

  Future<List<Message>> getMessagesFromUserChat(
    UsersChatMessage userChatMessage,
  );
}

class MessageService implements IMessageService {
  final IMessageRepository messageRepository;

  MessageService(this.messageRepository);

  @override
  Future<Message> saveMessage(Message message) async {
    final MessageEntity createdMessage =
        await messageRepository.save(MessageMapper.toEntity(message));
    return MessageMapper.fromEntity(createdMessage);
  }

  @override
  Future<List<Message>> getMessagesFromUserChat(
    UsersChatMessage userChatMessage,
  ) async {
    List<MessageEntity> messagesEntities =
        await messageRepository.getMessagesFromUsersChat(
            UserChatMessageMapper.toEntity(userChatMessage));
    return messagesEntities.map((e) => MessageMapper.fromEntity(e)).toList();
  }
}
