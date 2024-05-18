import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_communication_problem/presentation/controllers/counter2_controller.dart';

class Counter2 extends StatefulWidget {
  const Counter2({super.key});

  @override
  State<Counter2> createState() => _Counter2State();
}

class _Counter2State extends State<Counter2> {
  final counter2controller = Modular.get<Counter2Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter 2 page"),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Text("Counter 2: ${counter2controller.value}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter2controller.incrementTheCounterController();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
