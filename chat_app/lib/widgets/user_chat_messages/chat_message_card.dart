import 'package:chat_app/functions/date_time_functions.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/messages/message_screen.dart';
import 'package:chat_app/widgets/user_chat_messages/show_user_profile_image_card.dart';
import 'package:flutter/material.dart';

class UsersChatMessageCard extends StatefulWidget {
  final User sentToUser;
  final List<Message> messages;

  const UsersChatMessageCard({
    super.key,
    required this.sentToUser,
    required this.messages,
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
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MessagePageScreen(
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
    );
  }
}

class LastMessageTime extends StatefulWidget {
  const LastMessageTime({
    super.key,
    required this.lastMessage,
  });

  final Message? lastMessage;

  @override
  State<LastMessageTime> createState() => _LastMessageTimeState();
}

class _LastMessageTimeState extends State<LastMessageTime> {
  String lastMessageDate = "";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    lastMessageDate = widget.lastMessage != null
        ? convertDateTimeToString(widget.lastMessage!.sentTime)
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return Text(lastMessageDate);
  }
}
