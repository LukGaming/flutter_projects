import 'package:flutter/material.dart';
import 'package:flutter_core/core/infra/injector.dart';
import 'package:flutter_core/core/infra/locator.dart';
import 'package:flutter_core/core/presentation/controllers/messaging_controller.dart';
import 'package:flutter_core/core/presentation/messages_widgets/snackbar_widget.dart';

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
    final _messageController = DependencyInjector().get<MessagingController>();
    int snackbarCounter = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _messageController.showSnackbar(
                const SnackBar(
                  content: Text("Texto da snackbar"),
                ),
              );
              snackbarCounter++;
            },
            child: const Text("Mostrar Snackbar"),
          )
        ],
      ),
    );
  }
}
