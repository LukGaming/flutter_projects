import 'package:chat_app/infrastructure/dto/message.dart';
import 'package:chat_app/infrastructure/dto/user.dart';
import 'package:chat_app/infrastructure/dto/users_chat_message.dart';
import 'package:chat_app/presentation/controllers/chat_messages_controller.dart';
import 'package:chat_app/presentation/functions/message_functions.dart';
import 'package:chat_app/presentation/widgets/messages/last_message_widget.dart';
import 'package:chat_app/presentation/widgets/messages/message_screen.dart';
import 'package:chat_app/presentation/widgets/user_chat_messages/show_user_profile_image_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UsersChatMessageCard extends StatefulWidget {
  final User sentToUser;
  final UsersChatMessage usersChatMessage;

  const UsersChatMessageCard({
    super.key,
    required this.sentToUser,
    required this.usersChatMessage,
  });

  @override
  State<UsersChatMessageCard> createState() => _UsersChatMessageCardState();
}

class _UsersChatMessageCardState extends State<UsersChatMessageCard> {
  final _chatController = GetIt.instance<ChatMessagesController>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _chatController,
      builder: (_, __) {
        final List<Message> messages = _chatController.chatMessages
            .where((element) => widget.usersChatMessage.id == element.id)
            .first
            .messages;
        final orderedMessages = orderMessagesByDate(messages);

        Message? lastMessage = getLastMessage(messages);

        return Card(
          child: ListTile(
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessagePageScreen(
                        usersChatMessage: widget.usersChatMessage,
                        chatWithUser: widget.sentToUser,
                      ),
                    ),
                  ),
              leading: Hero(
                tag: widget.sentToUser.id.toString,
                child: ShowUserProfileImageCard(user: widget.sentToUser),
              ),
              title: Text(widget.sentToUser.name),
              subtitle: Text(
                lastMessage == null ? "" : lastMessage.bodyText,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: LastMessageTime(lastMessage: lastMessage)),
        );
      },
    );
  }
}
