// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:mobx_communication_problem/presentation/controllers/counter_controller.dart';

part 'counter2_controller.g.dart';

class Counter2Controller = CounterBase with _$Counter2Controller;

abstract class CounterBase with Store {
  final CounterController counterController;
  CounterBase(
    this.counterController,
  );
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void incrementTheCounterController() {
    counterController.increment();
  }
}
