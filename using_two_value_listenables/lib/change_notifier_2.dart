// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:using_two_value_listenables/base_controller.dart';
import 'package:using_two_value_listenables/base_state.dart';
import 'package:using_two_value_listenables/counter_value.dart';

class Notifier2<CounterState> extends BaseController {
  Notifier2() : super(CounterValue(count: 1));
  void increment() {
    update(CounterValue(count: (value as CounterValue).count + 1));
  }
}
