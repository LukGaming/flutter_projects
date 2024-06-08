import 'package:flutter/material.dart';

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
    getProducts();
    super.initState();
  }

  void removeProduct(Product product) {
    if (state is SuccessState) {
      ((state as SuccessState).state as List<Product>).remove(product);
      setState(() {});
    }
  }

  void throwStateError() {
    state = StateError(error: Exception("Erro gerado manualmente"));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de produtos"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            throwStateError();
          },
          child: const Icon(Icons.error),
        ),
        body: switch (state) {
          LoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
          SuccessState() => renderProductList((state as SuccessState).state),
          StateError() => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ocorreu um erro: ${(state as StateError).error}"),
                  ElevatedButton(
                    onPressed: () {
                      getProducts();
                    },
                    child: const Text("Tente novamente"),
                  )
                ],
              ),
            ),
          _ => const Text("Ocorreu um erro não rastreável ")
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

  void getProducts() {
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
    setState(() {});
  }
}
