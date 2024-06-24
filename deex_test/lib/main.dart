import 'package:flutter/material.dart';
import 'package:deex/deex.dart';

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
    final _notifier = ValueNotifier(0);
    return Deex(
      () {
        return Text("${_notifier.value} teste");
      },
    );
  }
}

class DeexTest extends DeexStore {
  final count = 0.obs;
}
