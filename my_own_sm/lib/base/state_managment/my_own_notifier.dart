// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_own_sm/base/state_managment/my_own_sm.dart';

class MyOwnNotifier<T> extends MyOwnSm {
  MyOwnNotifier(T state) : _state = state;
  T _state;

  set value(T newValue) {
    _state = newValue;
    update();
  }

  T get value => _state;
}
