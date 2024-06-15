import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_test/mixins/react.dart';
import 'package:sqflite_test/presentation/controllers/product_controller.dart';
import 'package:sqflite_test/presentation/models/product.dart';
import 'package:sqflite_test/presentation/views/create_products_page.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> with React {
  final _productManagmentController =
      GetIt.instance<ProductManagerController>();
  @override
  void initState() {
    super.initState();
    _productManagmentController.init();
  }

  @override
  Widget build(BuildContext context) {
    react(_productManagmentController);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      body: switch (_productManagmentController.isLoading) {
        true => const Center(
            child: CircularProgressIndicator(),
          ),
        _ => RenderProducts(products: _productManagmentController.products)
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateProductsPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RenderProducts extends StatefulWidget {
  final List<Product> products;
  const RenderProducts({
    super.key,
    required this.products,
  });

  @override
  State<RenderProducts> createState() => _RenderProductsState();
}

class _RenderProductsState extends State<RenderProducts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Nome do produto: ${widget.products[index].name}"),
          trailing: Text("Preço: ${widget.products[index].price}"),
        );
      },
    );
  }
}
