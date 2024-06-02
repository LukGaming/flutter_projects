import 'package:chat_app/functions/message_state.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing messages status", () {
    test("The message status should be not sent", () {
      final notSentMessage = Message(
        id: 1,
        sendToUserId: 2,
        sendFromUserId: 0,
        bodyText: "Test",
        messageFiles: [],
        cratedAt: DateTime.now(),
        isSent: false,
        received: false,
        seen: false,
      );

      expect(
          getMessageStatusFromMessage(notSentMessage), EMessageStatus.notSent);
    });

    test(
      "The message status should be sent",
      () {
        final notSentMessage = Message(
          id: 1,
          sendToUserId: 2,
          sendFromUserId: 0,
          bodyText: "Test",
          messageFiles: [],
          cratedAt: DateTime.now(),
          isSent: true,
          received: false,
          seen: false,
        );

        expect(
            getMessageStatusFromMessage(notSentMessage), EMessageStatus.sent);
      },
    );

    test(
      "The message status should be received",
      () {
        final notSentMessage = Message(
          id: 1,
          sendToUserId: 2,
          sendFromUserId: 0,
          bodyText: "Test",
          messageFiles: [],
          cratedAt: DateTime.now(),
          isSent: true,
          received: true,
          seen: false,
        );

        expect(getMessageStatusFromMessage(notSentMessage),
            EMessageStatus.received);
      },
    );

    test(
      "The message status should be seen",
      () {
        final notSentMessage = Message(
          id: 1,
          sendToUserId: 2,
          sendFromUserId: 0,
          bodyText: "Test",
          messageFiles: [],
          cratedAt: DateTime.now(),
          isSent: true,
          received: true,
          seen: true,
        );

        expect(
            getMessageStatusFromMessage(notSentMessage), EMessageStatus.seen);
      },
    );
  });
}
