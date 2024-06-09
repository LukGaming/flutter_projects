import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_streams/stream_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Widget build(BuildContext context) {
    final names = ref.watch(namesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nomes"),
      ),
      body: switch (names) {
        AsyncData() => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    names.value[index],
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
