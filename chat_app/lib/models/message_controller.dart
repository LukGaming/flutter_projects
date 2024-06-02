import 'package:flutter/material.dart';

class MessageController {
  final TextEditingController messageTextController;
  final List<FileImage> images;

  MessageController({
    required this.messageTextController,
    required this.images,
  });

  MessageController clearMessageController() {
    messageTextController.text = "";
    return MessageController(
      messageTextController: messageTextController,
      images: [],
    );
  }
}
