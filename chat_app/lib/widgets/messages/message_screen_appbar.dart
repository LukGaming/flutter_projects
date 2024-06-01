import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/user_chat_messages/show_user_profile_image_card.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  final User chatWithUser;

  const ChatAppBar({
    super.key,
    required this.chatWithUser,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Icon(Icons.remove),
        Icon(Icons.add),
        Icon(Icons.add),
        Icon(Icons.add),
      ],
      leading: Row(
        children: [
          const Icon(Icons.arrow_back_rounded),
          Hero(
            tag: chatWithUser.id.toString,
            child: ShowUserProfileImageCard(user: chatWithUser),
          ),
        ],
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(chatWithUser.name),
            ],
          ),
          const Row(
            children: [
              Text("Visto por ultimo: 14:05"),
            ],
          )
        ],
      ),
    );
  }
}