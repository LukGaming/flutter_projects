import 'package:chat_app/functions/date_time_functions.dart';
import 'package:chat_app/functions/message_state.dart';
import 'package:chat_app/functions/status_message_status_icon.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageWidget extends StatelessWidget {
  final bool isMyMessage;
  final Message message;
  const MessageWidget({
    super.key,
    required this.message,
    required this.isMyMessage,
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
              color: isMyMessage ? rightContainerColor : leftContainerColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  message.bodyText,
                  style: TextStyle(
                    color: isMyMessage
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
                    isMyMessage
                        ? SentMessageStatus(
                            message: message,
                          )
                        : Container(),
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

class SentMessageStatus extends StatefulWidget {
  final Message message;
  const SentMessageStatus({
    super.key,
    required this.message,
  });

  @override
  State<SentMessageStatus> createState() => _SentMessageStatusState();
}

class _SentMessageStatusState extends State<SentMessageStatus> {
  final sizedBoxWidth = const SizedBox(width: 5);

  Icon messageStatusIcon = const Icon(null);
  @override
  void initState() {
    super.initState();
    messageStatusIcon = getMessageStatusIcon(widget.message);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sizedBoxWidth,
        messageStatusIcon,
      ],
    );
  }
}
