import 'package:flutter/material.dart';
import 'package:my_own_sm/presentation/controllers/my_first_state_class.dart';
import 'package:my_own_sm/base/state_managment/my_own_sm_consumer.dart';
import 'package:my_own_sm/presentation/widgets/my_second_consumer_widget.dart';
import 'package:my_own_sm/dependencies/notifiers.dart';
import 'package:my_own_sm/presentation/widgets/product_widget.dart';
import 'package:my_own_sm/presentation/widgets/value_notifier_consumer.dart';

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
          TextButton(
            onPressed: removeWidget,
            child: const Text("Remover widget"),
          ),
          showWidget ? const ProductsWidget() : Container(),
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
