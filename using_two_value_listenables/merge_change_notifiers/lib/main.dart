import 'package:flutter/material.dart';
import 'package:merge_change_notifiers/change_notifier_examples.dart';
import 'package:merge_change_notifiers/multi_listenable_builder.dart';

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
  @override
  Widget build(BuildContext context) {
    final _example1Controller = Example1();
    final _example2Controller = Example2();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MultiListenableBuilder(
          listenables: [_example1Controller, _example2Controller],
          builder: (_) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Counter 1 value',
                  ),
                  Text(
                    '${_example1Controller.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Text(
                    'Counter 2 value',
                  ),
                  Text(
                    '${_example2Controller.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _example1Controller.increment();
                    },
                    child: const Text(
                      "Increment counter 1",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _example2Controller.increment();
                    },
                    child: const Text(
                      "Increment counter 1",
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
