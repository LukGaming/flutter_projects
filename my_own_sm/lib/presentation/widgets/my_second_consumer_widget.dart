import 'package:flutter/material.dart';
import 'package:my_own_sm/main.dart';

import 'package:my_own_sm/base/state_managment/my_own_sm_consumer.dart';
import 'package:my_own_sm/dependencies/notifiers.dart';

class MySecondConsumerWidget extends StatelessWidget {
  const MySecondConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyOwnSmConsumer(
      listenable: myState,
      builder: (context) {
        return Text("${myState.count}");
      },
    );
  }
}
