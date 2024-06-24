import 'package:chat_app/presentation/controllers/chat_messages_controller.dart';
import 'package:chat_app/presentation/widgets/user_chat_messages/chat_message_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UserListChats extends StatefulWidget {
  const UserListChats({super.key});

  @override
  State<UserListChats> createState() => _UserListChatsState();
}

class _UserListChatsState extends State<UserListChats> {
  final _chatMessagesController = GetIt.instance<ChatMessagesController>();
  @override
  void initState() {
    _chatMessagesController.getChatsMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
            listenable: _chatMessagesController,
            builder: (_, __) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final chatMessage =
                      _chatMessagesController.chatMessages[index];

                  //TODO: trocar para usuário real
                  final currentLoggedUser = _chatMessagesController.users
                      .where((element) =>
                          element.id == _chatMessagesController.loggedUserId)
                      .first;

                  final userToSendMessage = _chatMessagesController.users
                      .where((element) =>
                          element.id != _chatMessagesController.loggedUserId)
                      .first;

                  return UsersChatMessageCard(
                    sentToUser: userToSendMessage,
                    usersChatMessage: chatMessage,
                  );
                },
                itemCount: _chatMessagesController.chatMessages.length,
              );
            }),
      ),
    );
  }
}
