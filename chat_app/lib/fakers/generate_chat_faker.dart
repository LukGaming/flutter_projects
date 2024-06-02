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

  for (int i = 0; i < 10; i++) {
    var firstMessage = Message(
      id: i,
      sendToUserId: users[0].id,
      sendFromUserId: users[1].id,
      bodyText: Faker().lorem.random.string(500),
      messageFiles: [],
      sentTime: DateTime.now(),
    );

    var secondMessage = Message(
      id: i,
      sendToUserId: users[1].id,
      sendFromUserId: users[0].id,
      bodyText: Faker().lorem.random.string(500),
      sentTime: DateTime.now(),
      messageFiles: [],
    );
    messages.addAll([firstMessage, secondMessage]);
  }

  final firstChat = UsersChatMessage(
    id: 1,
    sentFromUserId: users[0].id,
    sentToUserId: users[1].id,
    messages: messages,
  );

  chatMessages.add(firstChat);
  return chatMessages;
}
