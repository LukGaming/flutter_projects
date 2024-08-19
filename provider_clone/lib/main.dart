import 'package:flutter/material.dart';
import 'package:provider_clone/provider.dart';
import 'package:provider_clone/provider_extension.dart';

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier() : super(0);
}

class SecondNotifier extends ValueNotifier<int> {
  SecondNotifier() : super(20);
}

final firstProvider = CounterNotifier();
final secondProvider = SecondNotifier();

void main() => runApp(
      Provider(
        providers: [
          NotifierProvider(listenable: secondProvider),
          NotifierProvider(listenable: firstProvider),
        ],
        child: const MyApp(),
      ),
    );

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late final ValueNotifier _counterNotifier =
        context.readValue<CounterNotifier>();
    late final ValueNotifier _secondNotifier =
        context.readValue<SecondNotifier>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: ${_counterNotifier.value}",
            ),
            ElevatedButton(
              onPressed: () {
                _counterNotifier.value += 1;
              },
              child: const Text("Increment"),
            ),
            Text(
              "Counter: ${_secondNotifier.value}",
            ),
          ],
        ),
      ),
    );
  }
}
