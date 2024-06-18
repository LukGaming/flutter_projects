import 'package:chat_app/domains/models/message.dart';

List<Message> orderMessagesByDate(
  List<Message> messages,
) {
  messages.sort((a, b) => b.cratedAt.compareTo(a.cratedAt));
  return messages;
}

Message? getLastMessage(List<Message> messages) {
  if (messages.isEmpty) {
    return null;
  } else {
    return orderMessagesByDate(messages).first;
  }
}
