import 'package:flutter/material.dart';
import 'package:value_notifier_transparente/transparent_value_notifier.dart';

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
  final myNotifier = MyOwnSm(0);
  final toggleReaction = MyOwnSm(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programação Transparente"),
      ),
      body: ValueObserver(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              toggleReaction.value
                  ? Text(
                      myNotifier.value.toString(),
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
        );
      }),
    );
  }
}

class ValueObserver extends StatefulWidget {
  final Widget Function() builder;
  const ValueObserver(this.builder, {super.key});

  @override
  State<ValueObserver> createState() => _ValueObserverState();
}

class _ValueObserverState extends State<ValueObserver> {
  late VoidCallback _disposeReaction;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      reaction(() {
        widget.builder();
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    if (_disposeReaction != null) {
      _disposeReaction();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }
}
