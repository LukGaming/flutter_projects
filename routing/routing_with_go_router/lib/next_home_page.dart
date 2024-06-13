import 'package:flutter/material.dart';

class NextHomePage extends StatelessWidget {
  const NextHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar title"),
      ),
      body: const Center(
        child: Text("Estamos na outra home page"),
      ),
    );
  }
}
