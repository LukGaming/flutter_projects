import 'package:mobx/mobx.dart';
part 'counter_controller.g.dart';

class CounterController = BaseController with _$CounterController;

abstract class BaseController with Store {
  @observable
  int count = 0;

  @action
  increment() {
    count++;
  }

  @action
  decrement() {
    count--;
  }
}
