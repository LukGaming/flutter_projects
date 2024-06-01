import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:chat_app/widgets/messages/last_message_widget.dart';
import 'package:chat_app/widgets/messages/message_screen.dart';
import 'package:chat_app/widgets/user_chat_messages/show_user_profile_image_card.dart';
import 'package:flutter/material.dart';

class UsersChatMessageCard extends StatefulWidget {
  final User sentToUser;
  final UsersChatMessage usersChatMessage;
  final List<Message> messages;

  const UsersChatMessageCard({
    super.key,
    required this.sentToUser,
    required this.messages,
    required this.usersChatMessage,
  });

  @override
  State<UsersChatMessageCard> createState() => _UsersChatMessageCardState();
}

class _UsersChatMessageCardState extends State<UsersChatMessageCard> {
  Message? lastMessage;
  @override
  void initState() {
    super.initState();
    if (widget.messages.isNotEmpty) {
      List<Message> messages = widget.messages;
      messages.sort((a, b) => a.sentTime.compareTo(b.sentTime));
      lastMessage = messages.last;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MessagePageScreen(
              usersChatMessage: widget.usersChatMessage,
              chatWithUser: widget.sentToUser,
              messages: widget.messages,
            ),
          ),
        ),
        leading: Hero(
          tag: widget.sentToUser.id.toString,
          child: ShowUserProfileImageCard(user: widget.sentToUser),
        ),
        title: Text(widget.sentToUser.name),
        subtitle: Text(
          lastMessage != null ? lastMessage!.bodyText : "",
          overflow: TextOverflow.ellipsis,
        ),
        trailing: LastMessageTime(lastMessage: lastMessage),
      ),
    );
  }
}
