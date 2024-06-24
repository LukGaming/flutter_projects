import 'package:flutter/material.dart';

class MessagingController extends ValueNotifier<BaseMessage> {
  MessagingController() : super(InitialMessage());

  void showSnackbar({
    required SnackBar snackBar,
    bool closePreviousSnackBar = false,
  }) {
    value = ShowSnackbarMessage(
      snackBar: snackBar,
      closePreviousSnackBar: closePreviousSnackBar,
    );
  }
}

abstract class BaseMessage {}

class InitialMessage extends BaseMessage {}

class ShowSnackbarMessage extends BaseMessage {
  final SnackBar snackBar;
  final bool closePreviousSnackBar;

  ShowSnackbarMessage({
    required this.snackBar,
    this.closePreviousSnackBar = false,
  });
}
