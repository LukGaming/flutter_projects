import 'dart:ui';

import 'package:flutter/foundation.dart';

class MessagingController extends ValueNotifier<BaseMessage> {
  MessagingController() : super(InitialMessage());
}

abstract class BaseMessage {}

class InitialMessage extends BaseMessage {}

class ShowSnackbarMessage extends BaseMessage {
  final String message;
  Color? backGroundColor;

  ShowSnackbarMessage(
    this.message, {
    required required,
  });
}
