import 'dart:math';

class CounterRepository {
  int getRandomNumber() {
    return Random().nextInt(1000);
  }
}
