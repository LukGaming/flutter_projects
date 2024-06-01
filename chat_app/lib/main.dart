import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:chat_app/user_chat_messages/chat_message_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IndividualChatPage(),
    );
  }
}

class IndividualChatPage extends StatefulWidget {
  const IndividualChatPage({super.key});

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  final loggedUserId = 0;
  List<UsersChatMessage> chatMessages = [];

  List<User> users = [
    User(
      id: 0,
      name: "Paulo",
      email: "thelukgaming333@gmail.com",
      profileImageUrl: null,
    ),
    User(
      id: 1,
      name: "Maria",
      email: "maria@gmail.com",
      profileImageUrl: null,
    ),
  ];

  @override
  void initState() {
    super.initState();

    List<Message> messages = [];

    final firstMessage = Message(
      id: 1,
      sendToUserId: users[0].id,
      sendFromUserId: users[1].id,
      bodyText: "Olá, bom dia, tudo bem?",
      messageFiles: [],
      sentTime: DateTime.now(),
    );

    final secondMessage = Message(
      id: 2,
      sendToUserId: users[1].id,
      sendFromUserId: users[0].id,
      bodyText: "Bom dia, tudo bem sim, e contigo?",
      sentTime: DateTime.now().add(const Duration(seconds: 1)),
      messageFiles: [],
    );

    messages.addAll([firstMessage, secondMessage]);

    final firstChat = UsersChatMessage(
      id: 1,
      user1Id: users[0].id,
      user2Id: users[1].id,
      messages: messages,
    );

    chatMessages.add(firstChat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final chatMessage = chatMessages[index];
          final currentLoggedUser =
              users.where((element) => element.id == loggedUserId).first;

          final userToSendMessage =
              users.where((element) => element.id != loggedUserId).first;

          return Card(
            child: UsersChatMessageCard(
              sentToUser: userToSendMessage,
              messages: chatMessage.messages,
            ),
          );
        },
        itemCount: chatMessages.length,
      ),
    );
  }
}
