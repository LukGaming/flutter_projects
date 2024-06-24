import 'package:flutter/material.dart';
import 'package:flutter_core/core/abstract/abstract_base_state_controller.dart';
import 'package:flutter_core/core/abstract/abstract_controller.dart';

class _CounterController extends BaseController<int> {
  //iniciamos com um valor inicial no super
  _CounterController() : super(0);

  //exemplo de método
  void increment() {
    state++;
    update(); // notifica os escutadores
  }

  void decrement() {
    state--;
    update();
  }
}

class TestableCounterWidget extends StatefulWidget {
  const TestableCounterWidget({super.key});

  @override
  State<TestableCounterWidget> createState() => _TestableCounterWidgetState();
}

class _TestableCounterWidgetState extends State<TestableCounterWidget> {
  final _counterController = _CounterController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _counterController,
      builder: (context, child) {
        return Column(
          children: [
            Text("Counter value: ${_counterController.state}"),
            ElevatedButton(
              onPressed: _counterController.increment,
              child: const Text("Increment"),
            )
          ],
        );
      },
    );
  }
}
