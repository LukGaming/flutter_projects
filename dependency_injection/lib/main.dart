import 'package:dependency_injection/dependencies/injector.dart';
import 'package:dependency_injection/dependencies/locator.dart';
import 'package:dependency_injection/presentation/controllers/counter_controller.dart';
import 'package:flutter/material.dart';

void main() {
  myOwnLocator();
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
    final counterController = MyOwnInjector().instance<CounterController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListenableBuilder(
        listenable: counterController,
        builder: (_, __) {
          print("changing the state");
          return Text(
            counterController.count.toString(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterController.count++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
