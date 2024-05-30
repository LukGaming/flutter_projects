import 'dart:async';

import 'package:flutter/material.dart';

class MultiListenableBuilder extends StatefulWidget {
  final List<Listenable> listenables;
  final Widget Function(BuildContext context) builder;

  const MultiListenableBuilder({
    super.key,
    required this.listenables,
    required this.builder,
  });

  @override
  State<MultiListenableBuilder> createState() => _MultiListenableBuilderState();
}

class _MultiListenableBuilderState extends State<MultiListenableBuilder> {
  List<Listenable> listenables = [];
  @override
  void initState() {
    // TODO: implement initState

    // runZoned(() => widget.builder(context));

    // final inherited = context.dependOnInheritedWidgetOfExactType<Listenable>();
    // print(inherited);
    addListeners();
    super.initState();
  }

  void addListeners() {
    if (widget.listenables.isEmpty)
      throw Exception("Not Listenables inside MultiListenableBuilder");
    removeListeners();
    widget.listenables.forEach((listenable) {
      listenables.add(listenable);
      listenable.addListener(listenanbleReactive);
    });
  }

  void listenanbleReactive() {
    setState(() {});
  }

  void removeListeners() {
    listenables.forEach(
        (listenable) => listenable.removeListener(listenanbleReactive));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    removeListeners();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
