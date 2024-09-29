import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double proggress = 0;
  @override
  void initState() {
    startProggress();
    super.initState();
  }

  void startProggress() async {
    for (int i = 0; i <= 100; i++) {
      proggress = i / 100.0;
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linear Proggress indicator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${(proggress * 100).ceil()} %",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(
              value: proggress.toDouble(),
              minHeight: 20,
              color: proggress < 1 ? Colors.blue : Colors.green,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Sincronizando tal coisa"),
          ],
        ),
      ),
    );
  }
}
