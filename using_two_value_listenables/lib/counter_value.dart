import 'package:using_two_value_listenables/base_state.dart';

abstract class CounterState extends BaseState {}

class CounterValue extends BaseState {
  final int count;
  CounterValue({
    required this.count,
  });
}
