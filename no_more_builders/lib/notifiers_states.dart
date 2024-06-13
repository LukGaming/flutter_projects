import 'package:flutter/material.dart';

class MyState extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}
