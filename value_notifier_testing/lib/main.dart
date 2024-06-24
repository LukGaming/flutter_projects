import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = ValueNotifier<String>("teste");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testando o value Notifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, state, child) => Text(state),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
