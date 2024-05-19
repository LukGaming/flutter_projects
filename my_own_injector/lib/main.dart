import 'package:flutter/material.dart';
import 'package:my_own_injector/counter_controller.dart';
import 'package:my_own_injector/injector.dart';

void main() {
  final DependencyInjector i = DependencyInjector.instance;
  i.add(CounterController());

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
  final _counterController = DependencyInjector.instance<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListenableBuilder(
          listenable: _counterController,
          builder: (_, __) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${_counterController.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
