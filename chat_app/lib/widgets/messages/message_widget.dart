import 'package:chat_app/functions/date_time_functions.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/theme/colors.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: isRight ? rightContainerColor : leftContainerColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  message.bodyText,
                  style: TextStyle(
                    color: isRight
                        ? rightContainerTextColor
                        : leftContainerTextColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      convertDateTimeToHourAndMinutesString(
                        message.sentTime,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
