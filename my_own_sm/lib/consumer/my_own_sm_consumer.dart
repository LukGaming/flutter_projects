import 'package:flutter/material.dart';
import 'package:my_own_sm/base/state_managment/my_own_sm.dart';

class MyOwnSmConsumer extends StatefulWidget {
  final MyOwnSm listenable;
  final Widget Function(BuildContext context) builder;
  const MyOwnSmConsumer({
    super.key,
    required this.listenable,
    required this.builder,
  });

  @override
  State<MyOwnSmConsumer> createState() => _MyOwnSmConsumerState();
}

class _MyOwnSmConsumerState extends State<MyOwnSmConsumer> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.listenable.removeListener(listener);
  }

  void listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
