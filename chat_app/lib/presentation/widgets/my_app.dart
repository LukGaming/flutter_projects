import 'package:chat_app/presentation/theme/colors.dart';
import 'package:chat_app/presentation/widgets/user_chat_messages/chat_messages_list_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const UserListChats(),
    );
  }
}
