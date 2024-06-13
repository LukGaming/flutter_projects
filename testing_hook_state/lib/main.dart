import 'package:flutter/material.dart';
import 'package:hook_state/hook_state.dart';

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
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HookState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var counter = useNotifier(1);
    var counter2 = useNotifier(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("hook state"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter1: ${counter.value}"),
            Text("counter1: ${counter2.value}"),
            TextButton(
              onPressed: () {
                counter.value++;
              },
              child: const Text("Add value 1"),
            ),
            TextButton(
              onPressed: () {
                counter2.value++;
              },
              child: const Text("Add value 2"),
            )
          ],
        ),
      ),
    );
  }
}
