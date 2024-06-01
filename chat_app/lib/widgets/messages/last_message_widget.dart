import 'package:chat_app/functions/date_time_functions.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class LastMessageTime extends StatefulWidget {
  const LastMessageTime({
    super.key,
    required this.lastMessage,
  });

  final Message? lastMessage;

  @override
  State<LastMessageTime> createState() => _LastMessageTimeState();
}

class _LastMessageTimeState extends State<LastMessageTime> {
  String lastMessageDate = "";
  @override
  void initState() {
    super.initState();

    lastMessageDate = widget.lastMessage != null
        ? convertDateTimeToHourAndMinutesString(widget.lastMessage!.sentTime)
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return Text(lastMessageDate);
  }
}
