import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:using_two_value_listenables/change_notifier_1.dart';
import 'package:using_two_value_listenables/change_notifier_2.dart';
import 'package:using_two_value_listenables/counter_value.dart';
import 'package:using_two_value_listenables/merge_listenables_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _notifier1 = Notifier1();
  final _notifier2 = Notifier2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MergeValueListenables(
          listeners: [
            _notifier1,
            _notifier2,
          ],
          builder: (_) {
            final notifierState1 = _notifier1.state;
            final notifierState2 = _notifier2.state;

            if (notifierState1 is CounterValue &&
                notifierState2 is CounterValue) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'Valor do counter 1: ${_notifier1.state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Valor do counter 2: ${_notifier2.state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    ElevatedButton(
                      onPressed: _notifier1.increment,
                      child: const Text("Increment count 1"),
                    ),
                    ElevatedButton(
                      onPressed: _notifier2.increment,
                      child: const Text("Increment count 1"),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
