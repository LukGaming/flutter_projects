import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_own_sm/base/state_managment/my_own_notifier.dart';
import 'package:my_own_sm/consumer/my_own_sm_consumer.dart';
import 'package:my_own_sm/consumer/my_own_value_notifier_consumer.dart';
import 'package:my_own_sm/presentation/controllers/products_notifier.dart';
import 'package:my_own_sm/presentation/widgets/my_second_consumer_widget.dart';
import 'package:my_own_sm/dependencies/notifiers.dart';
import 'package:my_own_sm/presentation/widgets/product_widget.dart';
import 'package:my_own_sm/presentation/widgets/value_notifier_consumer.dart';

Future<void> locator() async {
  final i = GetIt.instance;
  i.registerSingleton<IProductNotifier>(ProductsNotifier());
}

Future<void> main() async {
  await locator();
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
  bool showWidget = true;
  void removeWidget() {
    showWidget = !showWidget;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ValueListenerTest(),
          const TestingMyOwnConsumer(),
          TextButton(
            onPressed: removeWidget,
            child: const Text("Remover widget"),
          ),
          showWidget ? const ProductsWidget(value: 1) : Container(),
          const ProductsWidget(value: 2),
          const MyOwnNotifierConsumer(),
          const MySecondConsumerWidget(),
          MyOwnSmConsumer(
            listenable: myState,
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(myState.count.toString()),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myState.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TestingMyOwnConsumer extends StatelessWidget {
  const TestingMyOwnConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var count = MyOwnNotifier(0);
    return MyOwnValueNotifierConsummer(
      valueListenable: count,
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  count.value++;
                },
                child: const Text("Increment"),
              ),
              Text("$state"),
            ],
          ),
        );
      },
    );
  }
}

class ValueListenerTest extends StatefulWidget {
  const ValueListenerTest({super.key});

  @override
  State<ValueListenerTest> createState() => _ValueListenerTestState();
}

class _ValueListenerTestState extends State<ValueListenerTest> {
  @override
  Widget build(BuildContext context) {
    final counter = ValueNotifier(0);
    return ValueListenableBuilder(
      valueListenable: counter,
      builder: (context, value, child) {
        return TextButton(
          onPressed: () {
            counter.value++;
          },
          child: Text(value.toString()),
        );
      },
    );
  }
}
