import 'package:chat_app/infrastructure/dto/message.dart';

abstract class IRemoteMessageService {
  Future<Message> sendMessageToUser(Message message);
}
