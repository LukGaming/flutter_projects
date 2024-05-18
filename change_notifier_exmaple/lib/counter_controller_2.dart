import 'package:flutter/material.dart';

class CounterController2 extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
  }
}
