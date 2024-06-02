import 'package:chat_app/controllers/chat_messages_controller.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SendMessageTextFieldWidget extends StatefulWidget {
  final User chatWithUser;
  final UsersChatMessage chatMessage;

  const SendMessageTextFieldWidget({
    super.key,
    required this.chatWithUser,
    required this.chatMessage,
  });

  @override
  State<SendMessageTextFieldWidget> createState() =>
      _SendMessageTextFieldWidgetState();
}

class _SendMessageTextFieldWidgetState
    extends State<SendMessageTextFieldWidget> {
  final _chatMessageController = GetIt.instance<ChatMessagesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: textFieldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextFormField(
        controller: _chatMessageController.textController,
        decoration: InputDecoration(
          hintText: "Digite uma mensagem",
          suffixIcon: InkWell(
            child: const Icon(Icons.send),
            onTap: () {
              _chatMessageController.sendMessage(
                toUser: widget.chatWithUser,
                bodyText: _chatMessageController.textController.text,
                hourSent: DateTime.now(),
                chatMessage: widget.chatMessage,
              );
            },
          ),
        ),
      ),
    );
  }
}
