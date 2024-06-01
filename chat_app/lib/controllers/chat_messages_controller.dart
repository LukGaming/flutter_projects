import 'dart:math';

import 'package:chat_app/fakers/generate_chat_faker.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessagesController extends ChangeNotifier {
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
    );

    int chatMessageIndex =
        chatMessages.indexWhere((element) => element.id == chatMessage.id);
    chatMessages[chatMessageIndex].messages.add(newMessage);
    print("Adicionando nova mensagem");
    notifyListeners();
  }
}
