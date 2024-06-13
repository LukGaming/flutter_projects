import 'package:flutter/material.dart';
import 'package:no_more_builders/mobx/counter_store.dart';
import 'package:no_more_builders/notifier_state.dart';
import 'package:no_more_builders/notifiers_states.dart';

final myState = MyState();

final myNotifier = ValueNotifier(0);

final notifierState = NotifierState();

final mobxStore = CounterStore();
