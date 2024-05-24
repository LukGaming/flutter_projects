import 'package:flutter/material.dart';

class SecondStepScreen extends StatefulWidget {
  const SecondStepScreen({super.key});

  @override
  State<SecondStepScreen> createState() => _SecondStepScreenState();
}

class _SecondStepScreenState extends State<SecondStepScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Olá, bem vindo a segunda etapa",
      ),
    );
  }
}
