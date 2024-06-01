import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/messages/message_screen_appbar.dart';
import 'package:chat_app/widgets/messages/message_widget.dart';
import 'package:flutter/material.dart';

class MessagePageScreen extends StatefulWidget {
  final User chatWithUser;

  final List<Message> messages;
  const MessagePageScreen({
    super.key,
    required this.chatWithUser,
    required this.messages,
  });

  @override
  State<MessagePageScreen> createState() => _MessagePageScreenState();
}

class _MessagePageScreenState extends State<MessagePageScreen> {
  List<Message> orderedMessages = [];
  @override
  void initState() {
    super.initState();
    orderedMessages = widget.messages;
    orderedMessages.sort((b, a) => b.sentTime.compareTo(a.sentTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: ChatAppBar(chatWithUser: widget.chatWithUser),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                MessageWidget(
                  message: message,
                  isRight: isCurrentUserMessage,
                )
              ],
            );
          },
          itemCount: orderedMessages.length,
          reverse: true,
        ),
      ),
    );
  }
}
