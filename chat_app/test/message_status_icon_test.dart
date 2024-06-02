import 'package:chat_app/functions/status_message_status_icon.dart';
import 'package:chat_app/infrastructure/dto/message.dart';
import 'package:chat_app/theme/message_status_icons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should verify the correct icon from message status", () {
    test("Should get the not sent Icon", () {
      final Message notSentMessage = Message(
        id: 1,
        sendToUserId: 1,
        sendFromUserId: 2,
        bodyText: "test",
        messageFiles: [],
        cratedAt: DateTime.now(),
        isSent: false,
        received: false,
        seen: false,
      );

      expect(getMessageStatusIcon(notSentMessage), notSentMessageIcon);
    });

    test("Should get sent message icon", () {
      final Message notSentMessage = Message(
        id: 1,
        sendToUserId: 1,
        sendFromUserId: 2,
        bodyText: "test",
        messageFiles: [],
        cratedAt: DateTime.now(),
        isSent: true,
        received: false,
        seen: false,
      );

      expect(getMessageStatusIcon(notSentMessage), sentMessageIcon);
    });

    test("Should get received message icon", () {
      final Message notSentMessage = Message(
        id: 1,
        sendToUserId: 1,
        sendFromUserId: 2,
        bodyText: "test",
        messageFiles: [],
        cratedAt: DateTime.now(),
        isSent: true,
        received: true,
        seen: false,
      );

      expect(getMessageStatusIcon(notSentMessage), receivedMessageIcon);
    });

    test("Should get seen message icon", () {
      final Message notSentMessage = Message(
        id: 1,
        sendToUserId: 1,
        sendFromUserId: 2,
        bodyText: "test",
        messageFiles: [],
        cratedAt: DateTime.now(),
        isSent: true,
        received: true,
        seen: true,
      );

      expect(getMessageStatusIcon(notSentMessage), seenMessageIcon);
    });
  });
}
