import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isRight;
  const MessageWidget({
    super.key,
    required this.message,
    required this.isRight,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: isRight ? Colors.red : Colors.blue,
      ),
      padding: const EdgeInsets.all(20),
      child: Text(message.bodyText),
    );
  }
}
