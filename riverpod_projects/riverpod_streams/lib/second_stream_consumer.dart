import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_streams/strings_provider.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda tela..."),
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
