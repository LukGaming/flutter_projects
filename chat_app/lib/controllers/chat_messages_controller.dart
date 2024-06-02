import 'dart:math';

import 'package:chat_app/fakers/generate_chat_faker.dart';
import 'package:chat_app/functions/message_state.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessagesController extends ChangeNotifier {
  TextEditingController textController = TextEditingController();
  final loggedUserId = 0;
  List<UsersChatMessage> chatMessages = createFakeUserChatMessage();
  List<User> users = [
    User(
      id: 0,
      name: "Paulo",
      email: "thelukgaming333@gmail.com",
      profileImageUrl: null,
    ),
    User(
      id: 1,
      name: "Maria",
      email: "maria@gmail.com",
      profileImageUrl: null,
    ),
  ];

  void sendMessage({
    required User toUser,
    required String bodyText,
    required DateTime hourSent,
    required UsersChatMessage chatMessage,
  }) async {
    final newMessage = Message(
      id: Random().nextInt(2555),
      sendToUserId: toUser.id,
      sendFromUserId: loggedUserId,
      bodyText: bodyText,
      messageFiles: [],
      sentTime: hourSent,
      isSent: false,
      received: false,
      seen: false,
    );

    int chatMessageIndex =
        chatMessages.indexWhere((element) => element.id == chatMessage.id);

    Message newMessageStatus = newMessage.notSentMessageCopyWith();

    chatMessages[chatMessageIndex].messages.add(newMessageStatus);

    print(newMessageStatus.printMessageStatus());

    print(getMessageStatusFromMessage(newMessageStatus));

    textController.clear();

    notifyListeners();
  }
}
