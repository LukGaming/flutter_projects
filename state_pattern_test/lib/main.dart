import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_pattern_test/base_state.dart';
import 'package:state_pattern_test/product.dart';

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
      home: const ProductsPage(),
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  BaseState state = LoadingState();

  @override
  void initState() {
    List<Product> produtos = [
      Product(
        id: 1,
        name: "Produto 1",
      ),
      Product(
        id: 2,
        name: "Produto 2",
      )
    ];
    state = SuccessState(state: produtos);
    super.initState();
  }

  void removeProduct(Product product) {
    if (state is SuccessState) {
      ((state as SuccessState).state as List<Product>).remove(product);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de produtos"),
        ),
        body: switch (state) {
          LoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
          SuccessState() => renderProductList((state as SuccessState).state),
          _ => const Text("Ocorreu um erro não rastreável")
        });
  }

  Widget renderProductList(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(products[index].name),
        trailing: TextButton(
            onPressed: () {
              removeProduct(products[index]);
            },
            child: const Text("Remover produto")),
      ),
    );
  }
}
