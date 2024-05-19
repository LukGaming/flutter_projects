import 'package:flutter/material.dart';
import 'package:using_two_value_listenables/base_state.dart';

abstract class BaseController<BaseState> extends ChangeNotifier
    implements ValueNotifier<BaseState> {
  BaseController(BaseState initialState) {
    update(initialState);
  }
  late ValueNotifier<BaseState> _valueNotifier;
  @override
  BaseState get value => _valueNotifier.value;

  BaseState get state => _valueNotifier.value;

  @override
  set value(BaseState newValue) {
    _valueNotifier = ValueNotifier<BaseState>(newValue);
  }

  void update(BaseState newValue) {
    _valueNotifier = ValueNotifier<BaseState>(newValue);
    notifyListeners();
  }
}
