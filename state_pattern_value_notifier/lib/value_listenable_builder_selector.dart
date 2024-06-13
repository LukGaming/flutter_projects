import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilderSelector<T> extends StatefulWidget {
  final Function buildWhen;
  final ValueListenable<T> listenable;
  final Widget Function(BuildContext context, T state) builder;

  const ValueListenableBuilderSelector({
    super.key,
    required this.buildWhen,
    required this.listenable,
    required this.builder,
  });

  @override
  State<ValueListenableBuilderSelector> createState() =>
      _ValueListenableBuilderSelectorState();
}

class _ValueListenableBuilderSelectorState
    extends State<ValueListenableBuilderSelector> {
  @override
  void initState() {
    widget.listenable.addListener(listenToListenable);

    super.initState();
  }

  void listenToListenable() {
    print(widget.listenable.value);
    if (widget.buildWhen(widget.listenable)) {
      print("Pode rebuildar");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.listenable);
  }
}
