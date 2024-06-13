import 'package:flutter/material.dart';
import 'package:my_own_sm/base/state_managment/my_own_notifier.dart';

class MyOwnValueNotifierConsummer<T> extends StatefulWidget {
  final MyOwnNotifier<T> valueListenable;

  final Widget Function(BuildContext context, T value) builder;

  const MyOwnValueNotifierConsummer({
    super.key,
    required this.builder,
    required this.valueListenable,
  });

  @override
  State<MyOwnValueNotifierConsummer<T>> createState() =>
      _MyOwnValueNotifierConsummerState<T>();
}

class _MyOwnValueNotifierConsummerState<T>
    extends State<MyOwnValueNotifierConsummer<T>> {
  late T value;
  @override
  void initState() {
    super.initState();

    value = widget.valueListenable.value;
    widget.valueListenable.addListener(callbackListener);
  }

  void callbackListener() {
    print("Setting state");
    value = widget.valueListenable.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value);
  }
}
