import 'package:flutter/material.dart';
import 'package:state_notifier_v2/state_notifier_builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterNotifier = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                counterNotifier.value -= 1;
              },
              child: const Text("Decrement"),
            ),
            StateNotifierBuilder(
              listenable: counterNotifier,
              listen: (context, state) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Value: $state")));
              },
              buildWhen: (oldState, newState) {
                print("oldState; $oldState, newState: $newState");
                return newState < 10 && newState > 0;
              },
              builder: (context, state) {
                return Text("Counter: $state");
              },
            ),
            ElevatedButton(
              onPressed: () {
                counterNotifier.value += 1;
              },
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
