import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin React<T extends StatefulWidget> on State<T> {
  final List<Listenable> _listenables = [];

  void listenableCallback() {
    if (mounted) {
      setState(() {});
    }
  }

  E reactToValueListenable<E>(
    ValueListenable<E> valueListenable,
  ) {
    valueListenable.addListener(listenableCallback);
    if (_listenables.contains(valueListenable)) {
      _listenables.add(valueListenable);
    }
    return valueListenable.value;
  }

  void reactToNotifier(Listenable listenable) {
    listenable.addListener(listenableCallback);
    _listenables.add(listenable);
  }

  void reactToManyNotifiers(List<Listenable> listenables) {
    for (int i = 0; i < listenables.length; i++) {
      listenables[i].addListener(listenableCallback);
      _listenables.add(listenables[i]);
    }
  }

  @override
  void dispose() {
    for (final listenable in _listenables) {
      listenable.removeListener(listenableCallback);
    }
    _listenables.clear();
    super.dispose();
  }
}
