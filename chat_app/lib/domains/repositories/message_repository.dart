import 'package:chat_app/domains/entities/message_entity.dart';

abstract class IMessageRepository {
  Future<MessageEntity> save(MessageEntity message);
}
