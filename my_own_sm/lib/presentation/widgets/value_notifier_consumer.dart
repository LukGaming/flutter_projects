import 'package:flutter/material.dart';
import 'package:my_own_sm/base/state_managment/my_own_notifier.dart';
import 'package:my_own_sm/base/state_managment/my_own_sm_consumer.dart';

class MyOwnNotifierConsumer extends StatelessWidget {
  const MyOwnNotifierConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final myOwnNotifier = MyOwnNotifier(0);

    return Column(
      children: [
        MyOwnSmConsumer(
          listenable: myOwnNotifier,
          builder: (context) => Text(myOwnNotifier.value.toString()),
        ),
        TextButton(
          onPressed: () {
            myOwnNotifier.value++;
          },
          child: const Text("Incrementar"),
        )
      ],
    );
  }
}
