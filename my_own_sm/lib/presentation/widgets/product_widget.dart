import 'package:flutter/material.dart';
import 'package:my_own_sm/base/base_state.dart';
import 'package:my_own_sm/models/product.dart';

import 'package:my_own_sm/base/state_managment/my_own_sm_consumer.dart';
import 'package:my_own_sm/presentation/controllers/products_notifier.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _productsNotifier = ProductsNotifier();
  @override
  void initState() {
    super.initState();
    _productsNotifier.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MyOwnSmConsumer(
        listenable: _productsNotifier,
        builder: (context) {
          final state = _productsNotifier.value;
          switch (state) {
            case LoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case SuccessState<List<Product>>():
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(state.data[index].name);
                },
                itemCount: state.data.length,
              );

            default:
              return TextButton(
                onPressed: () {
                  _productsNotifier.getProducts();
                },
                child: const Text("Reload"),
              );
          }
        });
  }
}
