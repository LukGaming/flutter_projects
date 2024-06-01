import 'package:chat_app/fakers/generate_chat_faker.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:chat_app/widgets/user_chat_messages/chat_message_card.dart';
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
    chatMessages = createFakeUserChatMessage();
    super.initState();
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
          //TODO: trocar para usuário real
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
