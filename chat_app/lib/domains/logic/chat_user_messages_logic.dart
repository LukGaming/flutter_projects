import 'package:chat_app/infrastructure/dto/users_chat_message.dart';

class ChatUserMessagesLogic {
  Future<List<UsersChatMessage>> getUsersChatMessages() async {
    return [
      UsersChatMessage(
        id: 0,
        messages: [],
        sentFromUserId: 0,
        sentToUserId: 1,
      )
    ];
  }
}
