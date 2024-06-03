import 'package:flutter/material.dart';

class MultiListenableBuilder extends StatefulWidget {
  final List<Listenable> listenables;
  final Function(BuildContext) builder;
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
    super.initState();
    addListeners();
  }

  void addListeners() {
    if (widget.listenables.isEmpty) throw Exception("Not listeners found");
    removeListeners();

    widget.listenables.forEach((listenable) {
      listenables.add(listenable);
      listenable.addListener(listenableReactor);
    });
  }

  void removeListeners() {
    listenables.forEach(
        (listenable) => listenable.removeListener(() => listenableReactor()));
  }

  void listenableReactor() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
