import 'package:chat_app/presentation/controllers/chat_messages_controller.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/user.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';
import 'package:chat_app/presentation/functions/message_functions.dart';
import 'package:chat_app/presentation/widgets/messages/message_screen_appbar.dart';
import 'package:chat_app/presentation/widgets/messages/message_widget.dart';
import 'package:chat_app/presentation/widgets/messages/send_message_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MessagePageScreen extends StatefulWidget {
  final User chatWithUser;
  final UsersChatMessage usersChatMessage;

  const MessagePageScreen({
    super.key,
    required this.chatWithUser,
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
        preferredSize: const Size.fromHeight(50.0),
        child: ChatAppBar(chatWithUser: widget.chatWithUser),
      ),
      body: ListenableBuilder(
          listenable: _chatMessageController,
          builder: (_, __) {
            final userChatMessages = _chatMessageController.chatMessages
                .where(
                    (element) => element.sentToUserId == widget.chatWithUser.id)
                .first;
            final orderedMessages =
                orderMessagesByDate(userChatMessages.messages);

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final message = orderedMessages[index];

                        bool isMyMessage =
                            _chatMessageController.loggedUserId ==
                                message.sendFromUserId;

                        return Column(
                          crossAxisAlignment: isMyMessage
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: isMyMessage
                                  ? EdgeInsets.only(
                                      left:
                                          MediaQuery.of(context).size.width / 5,
                                      top: 10,
                                    )
                                  : EdgeInsets.only(
                                      right:
                                          MediaQuery.of(context).size.width / 5,
                                      top: 10,
                                    ),
                              child: MessageWidget(
                                message: message,
                                isMyMessage: isMyMessage,
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
