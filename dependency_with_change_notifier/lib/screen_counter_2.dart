import 'package:dependency_with_change_notifier/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Counter2Page extends StatefulWidget {
  const Counter2Page({super.key});

  @override
  State<Counter2Page> createState() => _Counter2PageState();
}

class _Counter2PageState extends State<Counter2Page> {
  final CounterController _counterController = GetIt.instance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tela de counter 2"),
      ),
      body: ListenableBuilder(
          listenable: _counterController,
          builder: (_, __) {
            return Center(
              child: Column(
                children: [
                  Text("Count: ${_counterController.counter}"),
                ],
              ),
            );
          }),
    );
  }
}
