import 'package:flutter/material.dart';

class CounterController1 extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
  }
}
