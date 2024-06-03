// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:chat_app/domains/logic/message_sender_logic.dart';
import 'package:chat_app/infrastructure/dto/message.dart';
import 'package:chat_app/infrastructure/dto/message_file.dart';
import 'package:chat_app/infrastructure/dto/user.dart';
import 'package:chat_app/infrastructure/dto/users_chat_message.dart';
import 'package:chat_app/presentation/functions/message_state.dart';
import 'package:chat_app/utilities/fakers/generate_chat_faker.dart';

class ChatMessagesController extends ChangeNotifier {
  final MessagesLogic messagesLogic;
  ChatMessagesController(this.messagesLogic);

  TextEditingController textController = TextEditingController();
  void startListeningToTextController() {
    textController = TextEditingController();
    textController.addListener(listenerOfTextController);
  }

  void listenerOfTextController() {
    print("Changing TextController: ${textController.text}");
    notifyListeners();
  }

  void removeListenerToTextController() {
    textController.removeListener(listenerOfTextController);
    textController.dispose();
  }

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
    required List<File> files,
  }) async {
    final newMessage = Message(
      id: Random().nextInt(2555),
      sendToUserId: toUser.id,
      sendFromUserId: loggedUserId,
      bodyText: bodyText,
      messageFiles: [],
      cratedAt: hourSent,
      isSent: false,
      received: false,
      seen: false,
    );

    List<MessageFile> messageFiles = [];

    if (files.isNotEmpty) {
      files.forEach(
        (element) {
          messageFiles.add(
            MessageFile(
              id: Random().nextInt(5000),
              serverSrc: "",
              downloadedToLocalStorage: false,
              localStoragePath: element.path,
              messageId: newMessage.id,
              sentToServer: false,
            ),
          );
        },
      );
    }

    newMessage.messageFiles = messageFiles;

    int chatMessageIndex =
        chatMessages.indexWhere((element) => element.id == chatMessage.id);

    Message newMessageStatus = newMessage.seenMessageCopyWith();

    chatMessages[chatMessageIndex].messages.add(newMessageStatus);

    print(newMessageStatus.printMessageStatus());

    print(getMessageStatusFromMessage(newMessageStatus));

    textController.clear();

    notifyListeners();
  }
}
