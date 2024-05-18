import 'package:mobx/mobx.dart';

part 'counter_controller.g.dart';

class CounterController = CounterBase with _$CounterController;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
