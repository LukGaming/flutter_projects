import 'package:dependency_with_change_notifier/counter_repository.dart';
import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  final CounterRepository counterRepository;
  CounterController(this.counterRepository);
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void incrementRandomNumber() {
    counter += counterRepository.getRandomNumber();
    notifyListeners();
  }
}
