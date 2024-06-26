import 'package:chat_app/presentation/functions/message_state.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/presentation/theme/message_status_icons.dart';
import 'package:flutter/material.dart';

Icon getMessageStatusIcon(Message message) {
  EMessageStatus messageStatus = getMessageStatusFromMessage(message);

  switch (messageStatus) {
    case EMessageStatus.notSent:
      return notSentMessageIcon;
    case EMessageStatus.sent:
      return sentMessageIcon;
    case EMessageStatus.received:
      return receivedMessageIcon;
    default:
      return seenMessageIcon;
  }
}
