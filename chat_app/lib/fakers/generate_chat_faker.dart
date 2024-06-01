import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/models/users_chat_message.dart';
import 'package:faker/faker.dart';

List<UsersChatMessage> createFakeUserChatMessage() {
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

  List<Message> messages = [];

  final firstMessage = Message(
    id: 1,
    sendToUserId: users[0].id,
    sendFromUserId: users[1].id,
    bodyText: Faker().lorem.random.string(500),
    messageFiles: [],
    sentTime: DateTime.now(),
  );

  final secondMessage = Message(
    id: 2,
    sendToUserId: users[1].id,
    sendFromUserId: users[0].id,
    bodyText: Faker().lorem.random.string(500),
    sentTime: DateTime.now().add(const Duration(seconds: -1)),
    messageFiles: [],
  );

  messages.addAll([
    firstMessage,
    secondMessage,
  ]);

  final firstChat = UsersChatMessage(
    id: 1,
    user1Id: users[0].id,
    user2Id: users[1].id,
    messages: messages,
  );

  chatMessages.add(firstChat);
  return chatMessages;
}
