import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_communication_problem/presentation/controllers/counter2_controller.dart';
import 'package:mobx_communication_problem/presentation/controllers/counter_controller.dart';
import 'package:mobx_communication_problem/presentation/pages/counter2_page.dart';

void main() {
  // var i = GetIt.instance;
  // i.registerLazySingleton<CounterController>(() => CounterController());
  // i.registerLazySingleton<Counter2Controller>(() => Counter2Controller(i()));

  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<CounterController>(() => CounterController.new);
    i.addLazySingleton<Counter2Controller>(() => Counter2Controller.new);
  }
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
  final _counterController = Modular.get<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${_counterController.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                onPressed: _counterController.increment,
                icon: const Icon(Icons.add),
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Counter2(),
          ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
