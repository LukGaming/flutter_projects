import 'package:chat_app/presentation/functions/date_time_functions.dart';
import 'package:chat_app/infrastructure/dto/message.dart';
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
        ? convertDateTimeToHourAndMinutesString(widget.lastMessage!.cratedAt)
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return Text(lastMessageDate);
  }
}
