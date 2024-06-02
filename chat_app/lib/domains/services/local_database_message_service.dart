import 'package:chat_app/models/message.dart';

abstract class ILocalDatabaseMessage {
  Future<Message> saveMessage(Message message);
}
