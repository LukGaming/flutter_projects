import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

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
    final controller = Controller();
    ValueNotifier<int> notifier = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("testando controller"),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, state, child) => const Center(
            child: Text("0"),
          ),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  Rx<int> count = Rx(0);
  void increment() {
    count.value++;
    update();
  }
}
