import 'package:flutter/material.dart';
import 'package:value_notifier_transparente/builder.dart';

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
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

final myNotifier = MyOwnSm(0);

class _MyPageState extends State<MyPage> {
  final toggleReaction = MyOwnSm(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programação Transparente"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            toggleReaction.value
                ? ListenValue(
                    (_) => Text(myNotifier.value.toString()),
                  )
                : Container(),
            ElevatedButton(
              onPressed: () {
                myNotifier.value++;
              },
              child: const Text("Increment"),
            ),
            ElevatedButton(
              onPressed: () {
                toggleReaction.value = !toggleReaction.value;
                setState(() {});
              },
              child: const Text("Toggle Reaction"),
            ),
          ],
        ),
      ),
    );
  }
}
