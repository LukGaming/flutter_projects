import 'package:flutter/material.dart';
import 'package:flutter_core/core/infra/locator.dart';
import 'package:flutter_core/core/presentation/messages_widgets/snackbar.dart';

void main() async {
  await locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => ShowSnackBarWidget(child: child!),
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Text("Mostrar Snackbar"))
        ],
      ),
    );
  }
}
