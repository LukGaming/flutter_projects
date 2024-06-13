import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_pattern_value_notifier/base_state.dart';
import 'package:state_pattern_value_notifier/product.dart';
import 'package:state_pattern_value_notifier/product_notifier.dart';
import 'package:state_pattern_value_notifier/value_listenable_builder_selector.dart';

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
  final _productNotifier = ProductNotifier();
  @override
  void initState() {
    _productNotifier.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier"),
      ),
      body: ValueListenableBuilderSelector(
        buildWhen: (state) {
          print("state here $state");
          return (state is! LoadingState);
        },
        listenable: _productNotifier,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SuccessState<List<Product>>) {
            final data = state.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("Nome: ${data[index].name}"),
                );
              },
            );
          }
          if (state is ErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  const Text("Ocorreu um erro."),
                  ElevatedButton(
                    onPressed: () {
                      _productNotifier.getProducts();
                    },
                    child: const Text("Tentar novamente..."),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _productNotifier.generateError();
        },
        child: const Icon(Icons.error),
      ),
    );
  }
}
