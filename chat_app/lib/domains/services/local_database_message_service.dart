import 'package:chat_app/domains/entities/message_entity.dart';
import 'package:chat_app/domains/repositories/message_repository.dart';
import 'package:chat_app/infrastructure/dto/message.dart';
import 'package:chat_app/infrastructure/mappers/message_mapper.dart';
import 'package:objectbox/objectbox.dart';

abstract class IMessageService {
  Future<Message> saveMessage(Message message);
}

class MessageService implements IMessageService {
  final IMessageRepository localDatabaseRepository;

  MessageService(this.localDatabaseRepository);
  @override
  Future<Message> saveMessage(Message message) async {
    final MessageEntity createdMessage =
        await localDatabaseRepository.save(MessageMapper.toEntity(message));
    return MessageMapper.toMessage(createdMessage);
  }
}
