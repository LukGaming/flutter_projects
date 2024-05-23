import 'package:flutter/material.dart';
import 'package:object_box/injector.dart';
import 'package:object_box/pages/todo_page.dart';

void main() async {
  var initDate = DateTime.now();
  await injector();

  var finishDate = DateTime.now();
  print(finishDate.difference(initDate));
  runApp(
    const MyApp(),
  );
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
      home: const TodosPage(),
    );
  }
}