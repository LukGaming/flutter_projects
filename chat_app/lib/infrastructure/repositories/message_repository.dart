import 'package:chat_app/domains/entities/message_entity.dart';
import 'package:chat_app/domains/repositories/message_repository.dart';
import 'package:objectbox/objectbox.dart';

class MessageRepository implements IMessageRepository {
  final Box<MessageEntity> messageBox;

  MessageRepository(this.messageBox);

  @override
  Future<MessageEntity> save(MessageEntity message) async {
    return messageBox.putAndGetAsync(message);
  }
}
