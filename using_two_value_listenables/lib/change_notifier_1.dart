import 'package:flutter/material.dart';
import 'package:using_two_value_listenables/base_controller.dart';
import 'package:using_two_value_listenables/base_state.dart';
import 'package:using_two_value_listenables/counter_value.dart';

class Notifier1<CounterState> extends BaseController {
  Notifier1() : super(CounterValue(count: 1));
  void increment() {
    update(CounterValue(count: (value as CounterValue).count + 1));
  }
}
