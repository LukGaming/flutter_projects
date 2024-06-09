import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_streams/second_stream_consumer.dart';
import 'package:riverpod_streams/strings_provider.dart';
import 'package:riverpod_streams/time_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const NamesScreen(),
    );
  }
}

class NamesScreen extends ConsumerStatefulWidget {
  const NamesScreen({super.key});

  @override
  ConsumerState<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends ConsumerState<NamesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback(
      (timeStamp) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Iniciando")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final names = ref.watch(namesProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SecondScreen(),
            ),
          );
        },
        child: const Icon(Icons.navigate_next_outlined),
      ),
      appBar: AppBar(
        title: const Text("Nomes"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer(
              builder: (context, ref, child) {
                final time = ref.watch(timeProvider);
                return switch (time) {
                  AsyncData(:final value) => Text(value.toString()),
                  AsyncError(:final error) => Text(error.toString()),
                  _ => Container()
                };
              },
            ),
          )
        ],
      ),
      body: switch (names) {
        AsyncData() => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(names.value[index]),
                  ),
                ),
              );
            },
            itemCount: names.value.length,
          ),
        AsyncError(:final error) => Center(
            child: Text(
              error.toString(),
            ),
          ),
        _ => Container()
      },
    );
  }
}
