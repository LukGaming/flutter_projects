import 'package:chat_app/models/message.dart';

abstract class IRemoteMessageService {
  Future<Message> sendMessageToUser(Message message);
}
