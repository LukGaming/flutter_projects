import 'package:flutter/foundation.dart';

class NotifierState extends ValueNotifier<BaseState> {
  NotifierState() : super(LoadingState());

  void changeToLoadingState() async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 2));
    value = SuccessState();
  }
}

abstract class BaseState {}

class LoadingState extends BaseState {}

class SuccessState extends BaseState {}
