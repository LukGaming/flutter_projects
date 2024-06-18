import 'dart:io';

import 'package:chat_app/presentation/controllers/chat_messages_controller.dart';
import 'package:chat_app/domains/models/user.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';
import 'package:chat_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class SendMessageTextFieldWidget extends StatefulWidget {
  final User chatWithUser;
  final UsersChatMessage chatMessage;

  const SendMessageTextFieldWidget({
    super.key,
    required this.chatWithUser,
    required this.chatMessage,
  });

  @override
  State<SendMessageTextFieldWidget> createState() =>
      _SendMessageTextFieldWidgetState();
}

class _SendMessageTextFieldWidgetState
    extends State<SendMessageTextFieldWidget> {
  final _chatMessageController = GetIt.instance<ChatMessagesController>();
  @override
  void initState() {
    super.initState();
    _chatMessageController.startListeningToTextController();
  }

  @override
  void dispose() {
    super.dispose();
    _chatMessageController.removeListenerToTextController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextFormField(
        maxLines: null,
        maxLength: 5000,
        controller: _chatMessageController.textController,
        decoration: InputDecoration(
          isDense: true,
          counter: Container(),
          hintText: "Digite uma mensagem",
          icon: ListenableBuilder(
              listenable: _chatMessageController,
              builder: (_, __) {
                final text = _chatMessageController.textController.text;
                return text == ""
                    ? InkWell(
                        onTap: () async {
                          XFile? pickedFile = await ImagePicker().pickImage(
                            source: ImageSource.camera,
                          );
                          if (pickedFile != null) {
                            File transformPickedFileToFile =
                                File(pickedFile.path);
                            showPickedFileForMessage(
                              context: context,
                              sentToUser: widget.chatWithUser,
                              file: transformPickedFileToFile,
                            );
                          }
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                      )
                    : const Icon(null);
              }),
          suffixIcon: InkWell(
            child: const Icon(
              Icons.send,
              size: 30,
            ),
            onTap: () {
              if (_chatMessageController.textController.text.trim() == "") {
                return;
              }
              _chatMessageController.sendMessage(
                files: [],
                toUser: widget.chatWithUser,
                bodyText: _chatMessageController.textController.text,
                hourSent: DateTime.now(),
                chatMessage: widget.chatMessage,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> showPickedFileForMessage({
    required BuildContext context,
    required File file,
    required User sentToUser,
  }) async {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          content: IntrinsicHeight(
            child: SendImageWidget(
              chatMessage: widget.chatMessage,
              fileToSend: file,
              sentToUser: sentToUser,
              whoCallsContext: dialogContext,
            ),
          ),
        );
      },
    );
  }
}

class SendImageWidget extends StatefulWidget {
  final User sentToUser;
  final File fileToSend;
  final UsersChatMessage chatMessage;
  final BuildContext whoCallsContext;

  const SendImageWidget({
    super.key,
    required this.sentToUser,
    required this.fileToSend,
    required this.whoCallsContext,
    required this.chatMessage,
  });

  @override
  State<SendImageWidget> createState() => _SendImageWidgetState();
}

class _SendImageWidgetState extends State<SendImageWidget> {
  final _chatMessageController = GetIt.instance<ChatMessagesController>();
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.file(widget.fileToSend),
          TextFormField(
            controller: _textEditingController,
            maxLength: 5000,
            maxLines: null,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  Navigator.of(widget.whoCallsContext).pop();
                  _chatMessageController.sendMessage(
                    bodyText: _textEditingController.text,
                    chatMessage: widget.chatMessage,
                    hourSent: DateTime.now(),
                    toUser: widget.sentToUser,
                    files: [
                      widget.fileToSend,
                    ],
                  );
                },
                child: const Icon(
                  Icons.send,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
