import 'package:chat_app/infrastructure/dto/message.dart';

abstract class IRemoteMessageService {
  Future<Message> sendMessageToUser(Message message);
}

class RemoteMessageServiceMock implements IRemoteMessageService {
  @override
  Future<Message> sendMessageToUser(Message message) async {
    return message.sentMessageCopyWith();
  }
}
