import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider/future_provider.dart';

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
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(todoResponseProvider);
  }

  @override
  Widget build(BuildContext context) {
    final todosProvider = ref.watch(todoResponseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: switch (todosProvider) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.todos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(value.todos[index].todo),
                  trailing: Checkbox(
                      value: value.todos[index].completed,
                      onChanged: (value) {}),
                ),
              );
            },
          ),
        AsyncError(:final error, :final stackTrace) =>
          Center(child: Text("Ocorreu um erro: $error, $stackTrace")),
        _ => const Center(child: CircularProgressIndicator())
      },
    );
  }
}
