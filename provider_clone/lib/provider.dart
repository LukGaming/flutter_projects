import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final List<NotifierProvider> providers;
  const Provider({
    super.key,
    required this.providers,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}

class NotifierProvider {
  final Listenable listenable;

  NotifierProvider({required this.listenable});
}
