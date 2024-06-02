import 'package:chat_app/infrastructure/dto/message.dart';

enum EMessageStatus { notSent, sent, received, seen }

EMessageStatus getMessageStatusFromMessage(Message message) {
  if (notSentMessage(message)) return EMessageStatus.notSent;
  if (isMessageSent(message)) return EMessageStatus.sent;
  if (isMessageReceived(message)) return EMessageStatus.received;
  return EMessageStatus.seen;
}

bool notSentMessage(Message message) {
  return !message.isSent && !message.received && !message.seen;
}

bool isMessageSent(Message message) {
  return message.isSent && (!message.received && !message.seen);
}

bool isMessageReceived(Message message) {
  return message.isSent && message.received && !message.seen;
}

bool isMessageSeen(Message message) {
  return message.isSent && message.received && message.seen;
}
