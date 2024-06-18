import 'package:chat_app/domains/logic/message_logic.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';

class ChatUserMessagesLogic {
  final MessagesLogic messagesLogic;

  ChatUserMessagesLogic(this.messagesLogic);

  Future<List<UsersChatMessage>> getUsersChatMessages() async {
    final usersChatMessage = UsersChatMessage(
      id: 0,
      messages: [],
      sentFromUserId: 0,
      sentToUserId: 1,
    );

    List<Message> messagesFromChats =
        await messagesLogic.getMessagesFromUserChat(usersChatMessage);
    return [
      usersChatMessage.copyWith(messages: messagesFromChats),
    ];
  }
}
