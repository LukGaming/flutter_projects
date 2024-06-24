import 'package:flutter/material.dart';
import 'package:statefulless/counter_controller.dart';
import 'package:statefulless/statefulless_mixin.dart';

class MyStateFulLessWidget extends StatelessWidget with StateFullLess {
  MyStateFulLessWidget({super.key});
  final _counterController = CounterController();
  final _textEditingController = TextEditingController();
  final _counter2 = ValueNotifier(0);
  final showWidget = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    notifierReact(_counterController, context);
    notifierReact(_counter2, context);
    notifierReact(showWidget, context);
    useTextEditingController(_textEditingController, context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _counterController.value++;
              },
              child: const Text(
                "Increment",
              ),
            ),
            Text(
              _counterController.value.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                _counter2.value++;
              },
              child: const Text(
                "Increment",
              ),
            ),
            Text(
              _counter2.value.toString(),
            ),
            showWidget.value
                ? TextFormField(
                    controller: _textEditingController,
                  )
                : const Text(
                    "Removendo TextEditingController",
                  ),
            Text(_textEditingController.text),
            ElevatedButton(
              onPressed: () {
                showWidget.value = !showWidget.value;
              },
              child: const Text("Toggle editingController"),
            ),
            ElevatedButton(
              onPressed: () {
                dispose();
              },
              child: const Text("Dispose"),
            )
          ],
        ),
      ),
    );
  }
}
