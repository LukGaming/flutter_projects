import 'package:flutter/material.dart';

class ValueNotifierTest extends StatefulWidget {
  const ValueNotifierTest({super.key});

  @override
  State<ValueNotifierTest> createState() => _ValueNotifierTestState();
}

class _ValueNotifierTestState extends State<ValueNotifierTest> {
  final valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) => Text(value.toString()),
    );
  }
}
