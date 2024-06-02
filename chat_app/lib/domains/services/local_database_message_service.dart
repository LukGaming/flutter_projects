import 'package:chat_app/infrastructure/dto/message.dart';

abstract class ILocalDatabaseMessageService {
  Future<Message> saveMessage(Message message);
}
