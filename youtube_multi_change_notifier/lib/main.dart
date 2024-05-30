import 'package:flutter/material.dart';
import 'package:youtube_multi_change_notifier/change_notifier_examples.dart';
import 'package:youtube_multi_change_notifier/multi_listenable_builder.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterController1 = CounterOneExample();
  final _counterController2 = CounterTwoExample();

  final _valueNotifier1 = ValueNotifier(0);
  final _valueNotifier2 = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    final listenalesTogether =
        Listenable.merge([_valueNotifier1, _valueNotifier2]);

    final listenablesTogether = Listenable.merge(
      [_counterController1, _counterController2],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ListenableBuilder(
              listenable: listenalesTogether,
              builder: (context, child) {
                return Text(
                    "${_valueNotifier1.value} + ${_valueNotifier2.value}");
              },
            ),
            ElevatedButton(
              onPressed: () => _valueNotifier1.value++,
              child: const Text("Incrementar notifier 1"),
            ),
            ListenableBuilder(
              listenable: listenablesTogether,
              builder: (context, child) => Text(
                  "${_counterController1.count} + ${_counterController2.count}"),
            ),
            MultiListenableBuilder(
              listenables: [
                _counterController1,
                _counterController2,
              ],
              builder: (_) {
                return Text(
                  '${_counterController1.count} + ${_counterController2.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  _counterController2.increment();
                },
                child: Text("Increment Count 2")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterController1.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
