// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:chat_app/domains/logic/chat_user_messages_logic.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/domains/logic/message_logic.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/message_file.dart';
import 'package:chat_app/domains/models/user.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';
import 'package:chat_app/presentation/functions/message_state.dart';

class ChatMessagesController extends ChangeNotifier {
  final ChatUserMessagesLogic chatUserMessagesLogic;
  final MessagesLogic messagesLogic;
  ChatMessagesController(this.messagesLogic, this.chatUserMessagesLogic);

  TextEditingController textController = TextEditingController();
  final loggedUserId = 0;
  List<UsersChatMessage> chatMessages = [];
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
  void getChatsMessages() async {
    chatMessages = await chatUserMessagesLogic.getUsersChatMessages();
    notifyListeners();
  }

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

  void sendMessage({
    required User toUser,
    required String bodyText,
    required DateTime hourSent,
    required UsersChatMessage chatMessage,
    required List<File> files,
  }) async {
    final newMessage = Message(
      id: null,
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
              id: null,
              serverSrc: "",
              downloadedToLocalStorage: false,
              localStoragePath: element.path,
              messageId: null,
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

    print("files: ${newMessage.messageFiles.length}");

    //Should we create the message to database here?

    chatMessages[chatMessageIndex]
        .messages
        .add(await messagesLogic.sendNewMessage(newMessageStatus));

    textController.clear();

    notifyListeners();
  }
}
