import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double opacity = 0;

  void toggleOpacity() {
    if (opacity == 0) {
      opacity = 1;
    } else {
      opacity = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animação de opacidade "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                toggleOpacity();
              },
              child: const Text("Toggle opacity"),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(
                seconds: 1,
              ),
              child: const Text("Opacidade"),
            )
          ],
        ),
      ),
    );
  }
}
