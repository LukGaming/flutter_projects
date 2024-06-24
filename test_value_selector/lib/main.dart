import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:value_selectable/value_selectable.dart';

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
  final intNotifier = ValueNotifier(0);

  final showString = ValueNotifier(false);

  final stringNotifier = ValueNotifier("Count: ");

  late final valueSelectorUsage = ValueSelector(
    (get) {
      final count = get(intNotifier);
      final canShowString = get(showString);
      if (!canShowString) {
        return count;
      }
      final string = get(stringNotifier);

      return "$string : $count";
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ValueSelector"),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: valueSelectorUsage,
          builder: (_, state, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.toString(),
                ),
                ElevatedButton(
                  onPressed: () {
                    showString.value = !showString.value;
                  },
                  child: const Text("Toggle show string"),
                ),
                ElevatedButton(
                  onPressed: () {
                    intNotifier.value++;
                  },
                  child: const Text("Increment"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
