import 'package:flutter/material.dart';

abstract class MyOwnSm {
  List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    print("Removendo Listener");
    _listeners.remove(listener);
    print(_listeners);
  }

  void update() {
    for (int i = 0; i < _listeners.length; i++) {
      _listeners[i].call();
    }
  }
}
