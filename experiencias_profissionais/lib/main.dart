import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final _
    return Scaffold(
      body: ListView(
        children: [
          const Text(
            "Formulário de Experiências",
            textAlign: TextAlign.center,
          ),
          Form(
            child: Column(
              children: [
                TextFormField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
