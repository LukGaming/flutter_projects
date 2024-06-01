import 'package:chat_app/functions/date_time_functions.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isRight;
  final Message message;
  const MessageWidget({
    super.key,
    required this.message,
    required this.isRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: isRight ? Colors.red : Colors.blue,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            message.bodyText,
            overflow: TextOverflow.clip,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(convertDateTimeToHourAndMinutesString(message.sentTime)),
            ],
          ),
        ],
      ),
    );
  }
}
