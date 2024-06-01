import 'package:chat_app/controllers/chat_messages_controller.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:chat_app/widgets/messages/message_screen_appbar.dart';
import 'package:chat_app/widgets/messages/message_widget.dart';
import 'package:chat_app/widgets/messages/send_message_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MessagePageScreen extends StatefulWidget {
  final User chatWithUser;
  final UsersChatMessage usersChatMessage;

  final List<Message> messages;
  const MessagePageScreen({
    super.key,
    required this.chatWithUser,
    required this.messages,
    required this.usersChatMessage,
  });

  @override
  State<MessagePageScreen> createState() => _MessagePageScreenState();
}

class _MessagePageScreenState extends State<MessagePageScreen> {
  final _chatMessageController = GetIt.instance<ChatMessagesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: ChatAppBar(chatWithUser: widget.chatWithUser),
      ),
      body: ListenableBuilder(
          listenable: _chatMessageController,
          builder: (_, __) {
            final userChatMessages = _chatMessageController.chatMessages
                .where(
                    (element) => element.sentToUserId == widget.chatWithUser.id)
                .first;
            final orderedMessages = userChatMessages.messages;

            orderedMessages.sort((a, b) => a.sentTime.compareTo(b.sentTime));

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final message = orderedMessages[index];

                        bool isCurrentUserMessage =
                            widget.chatWithUser.id == message.sendFromUserId;
                        return Column(
                          mainAxisAlignment: isCurrentUserMessage
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: isCurrentUserMessage
                                  ? const EdgeInsets.only(left: 30, top: 10)
                                  : const EdgeInsets.only(right: 30, top: 10),
                              child: MessageWidget(
                                message: message,
                                isRight: isCurrentUserMessage,
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: orderedMessages.length,
                      reverse: true,
                    ),
                  ),
                ),
                SendMessageTextFieldWidget(
                  chatWithUser: widget.chatWithUser,
                  chatMessage: widget.usersChatMessage,
                ),
              ],
            );
          }),
    );
  }
}
