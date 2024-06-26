import 'package:chat_app/domains/models/user.dart';
import 'package:flutter/material.dart';

class ShowUserProfileImageCard extends StatelessWidget {
  final User user;
  const ShowUserProfileImageCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.profileImageUrl != null
        ? Image.network(user.profileImageUrl!)
        : const Icon(Icons.person);
  }
}
