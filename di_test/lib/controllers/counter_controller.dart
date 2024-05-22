import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  CounterController() {
    print("Montando CounterController");
  }

  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
