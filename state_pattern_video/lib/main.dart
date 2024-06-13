// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductsBaseState state = LoadingState();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    state = LoadingState();
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    state = LoadedProducts(products: [
      Product(id: 1, name: "Product 1"),
      Product(id: 2, name: "Product 2"),
    ]);
    setState(() {});
  }

  void throwsErrorState() {
    state = ErrorState(error: Exception("I just throwed an error"));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throwsErrorState();
        },
        child: const Icon(Icons.error),
      ),
      body: switch (state) {
        LoadingState() => const Center(
            child: CircularProgressIndicator(),
          ),
        LoadedProducts() => ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text((state as LoadedProducts).products[index].name),
            ),
            itemCount: (state as LoadedProducts).products.length,
          ),
        ErrorState() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((state as ErrorState).error.toString()),
                ElevatedButton(
                  onPressed: () {
                    loadProducts();
                  },
                  child: const Text("Retry"),
                )
              ],
            ),
          ),
        _ => Container()
      },
    );
  }
}

class Product {
  int id;
  String name;
  Product({
    required this.id,
    required this.name,
  });
}

abstract class ProductsBaseState {}

class LoadingState extends ProductsBaseState {}

class LoadedProducts extends ProductsBaseState {
  List<Product> products;
  LoadedProducts({
    required this.products,
  });
}

class ErrorState extends ProductsBaseState {
  final Exception error;
  ErrorState({
    required this.error,
  });
}
