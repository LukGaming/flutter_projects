import 'package:chat_app/models/message.dart';

enum EMessageStatus { notSent, sent, received, seen }

EMessageStatus getMessageStatusFromMessage(Message message) {
  if (isMessageWaitingForSend(message)) return EMessageStatus.notSent;
  if (isMessageSent(message)) return EMessageStatus.sent;
  if (isMessageReceived(message)) return EMessageStatus.received;
  return EMessageStatus.seen;
}

bool isMessageWaitingForSend(Message message) {
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