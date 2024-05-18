import 'package:dependency_with_change_notifier/counter_controller.dart';
import 'package:dependency_with_change_notifier/injetor.dart';
import 'package:dependency_with_change_notifier/screen_counter_2.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  injetor();
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
  final CounterController _counterController = GetIt.instance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ListenableBuilder(
              listenable: _counterController,
              builder: (_, __) {
                return Text(
                  '${_counterController.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Counter2Page(),
                  ),
                );
              },
              child: const Text("Navigate to counter page"),
            ),
            ElevatedButton(
              onPressed: () {
                _counterController.incrementRandomNumber();
              },
              child: const Text("Add a random number to count"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
