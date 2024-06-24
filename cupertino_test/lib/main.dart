import 'package:cupertino_test/presentation/controllers/todo_controller.dart';
import 'package:cupertino_test/presentation/models/base_state.dart';
import 'package:cupertino_test/presentation/pages/todos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CupertinoApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Cupertino Todos app"),
      ),
      child: Stack(
        children: [
          const Expanded(child: TodosPage()),
          Positioned(
            bottom: 15,
            right: 15,
            child: CupertinoButton(
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
