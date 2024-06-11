import 'package:my_own_sm/base/state_managment/my_own_sm.dart';

class MyFirstStateClass extends MyOwnSm {
  int count = 0;

  void increment() {
    count++;
    update();
  }
}
