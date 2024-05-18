import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CounterController extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
