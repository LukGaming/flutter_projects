import 'package:flutter/material.dart';
import 'package:no_more_builders/main.dart';
import 'package:no_more_builders/notifier_state.dart';
import 'package:no_more_builders/notifiers.dart';
import 'package:no_more_builders/notifiers_extension.dart';

class TestNotifierStateWidget extends StatefulWidget {
  const TestNotifierStateWidget({super.key});

  @override
  State<TestNotifierStateWidget> createState() =>
      _TestNotifierStateWidgetState();
}

class _TestNotifierStateWidgetState extends State<TestNotifierStateWidget>
    with React {
  @override
  void initState() {
    super.initState();
    reactToNotifier(notifierState);
  }

  @override
  Widget build(BuildContext context) {
    return switch (notifierState.value) {
      LoadingState() => const Center(
          child: CircularProgressIndicator(),
        ),
      SuccessState<List<Product>>(:final data) => Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(data[index].name),
              ),
            ),
          ),
        ),
      _ => Container(),
    };
  }
}
