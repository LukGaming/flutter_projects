import 'package:flutter/material.dart';

import 'package:no_more_builders/notifier_state.dart';
import 'package:no_more_builders/notifiers.dart';
import 'package:no_more_builders/notifiers_extension.dart';
import 'package:no_more_builders/test_notifier_state.dart';

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

final valueListenable = ValueNotifier<BaseState>(LoadingState());

class _HomePageState extends State<HomePage> with React {
  bool showWidget = true;

  @override
  void initState() {
    super.initState();
    notifierState.changeToLoadingState();

    reactToManyNotifiers([
      notifierState,
      myState,
      myNotifier,
    ]);

    reactToNotifier(notifierState);
    reactToNotifier(myState);
    reactToNotifier(myNotifier);

    Future.delayed(const Duration(seconds: 1)).then(
        (e) => valueListenable.value = SuccessState(data: "Carregado..."));
  }

  void toggleWidget() {
    showWidget = !showWidget;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final valueListenableState = reactToValueListenable(valueListenable);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showWidget ? const TestNotifierStateWidget() : Container(),
            valueListenableState is LoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text("Estado carregado..."),
            ElevatedButton(
              onPressed: () {
                mobxStore.increment();
              },
              child: const Text("Increment mobx Store"),
            ),
            Text("changeNotifier value: ${myState.count}"),
            ElevatedButton(
              onPressed: () {
                myState.increment();
              },
              child: const Text("Increment ChangeNotifier"),
            ),
            Text("valueNotifier: ${myNotifier.value.toString()}"),
            ElevatedButton(
              onPressed: () {
                myNotifier.value++;
              },
              child: const Text("Increment ValueNotifier"),
            ),
            const TestNotifierStateWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleWidget();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
