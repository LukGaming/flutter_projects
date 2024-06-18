import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/user.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';
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

  // for (int i = 0; i < 10; i++) {
  var firstMessage = Message(
    id: 0,
    sendToUserId: users[0].id,
    sendFromUserId: users[1].id,
    bodyText: Faker().lorem.random.string(500),
    messageFiles: [],
    cratedAt: DateTime.now(),
    isSent: true,
    received: true,
    seen: true,
  );

  var secondMessage = Message(
    id: 1,
    sendToUserId: users[1].id,
    sendFromUserId: users[0].id,
    bodyText: Faker().lorem.random.string(500),
    cratedAt: DateTime.now(),
    messageFiles: [],
    isSent: true,
    received: true,
    seen: false,
  );

  var thirdMessage = Message(
    id: 2,
    sendToUserId: users[1].id,
    sendFromUserId: users[0].id,
    bodyText: Faker().lorem.random.string(500),
    cratedAt: DateTime.now(),
    messageFiles: [],
    isSent: true,
    received: true,
    seen: false,
  );
  messages.addAll([firstMessage, secondMessage, thirdMessage]);
  // }

  final firstChat = UsersChatMessage(
    id: 1,
    sentFromUserId: users[0].id,
    sentToUserId: users[1].id,
    messages: messages,
  );

  chatMessages.add(firstChat);
  return chatMessages;
}
