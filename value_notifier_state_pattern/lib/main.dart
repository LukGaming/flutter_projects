import 'package:flutter/material.dart';
import 'package:value_notifier_state_pattern/counter_notifier.dart';

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
    super.initState();
    _productNotifier.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App contador"),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _productNotifier,
          builder: (context, state, _) {
            if (state is InitialState) {
              return const Center(
                child: Text("Estado inicial"),
              );
            }
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsLoaded) {
              return ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(state.productList[index].name),
                  ),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((state as ErrorState).error.toString()),
                TextButton(
                  onPressed: () {
                    _productNotifier.getProducts();
                  },
                  child: const Text(
                    "Tentar novamente",
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _productNotifier.generateError();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
