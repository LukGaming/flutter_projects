import 'package:flutter/material.dart';
import 'package:hook_state/hook_state.dart';

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
      home: CounterNotifierWidget(),
    );
  }
}

class CounterNotifierWidget extends StatefulWidget {
  const CounterNotifierWidget({super.key});

  @override
  _CounterNotifierWidgetState createState() => _CounterNotifierWidgetState();
}

class _CounterNotifierWidgetState extends State<CounterNotifierWidget> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pressed the button this many times:'),
          ValueListenableBuilder<int>(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                '$value',
              );
            },
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Increment"))
        ],
      ),
    );
  }
}

class CounterNotifierWidgetHookState extends StatefulWidget {
  const CounterNotifierWidgetHookState({super.key});

  @override
  _CounterNotifierWidgetHookState createState() =>
      _CounterNotifierWidgetHookState();
}

class _CounterNotifierWidgetHookState extends State<CounterNotifierWidget>
    with HookStateMixin {
  @override
  Widget build(BuildContext context) {
    var _counter = useValueNotifier(0);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pressed the button this many times:'),
          Text(_counter.value.toString()),
          ElevatedButton(
            onPressed: () {
              _counter.value++;
            },
            child: const Text("Increment"),
          )
        ],
      ),
    );
  }
}
