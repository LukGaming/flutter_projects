import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_own_sm/base/models/base_state.dart';

import 'package:my_own_sm/models/product.dart';

import 'package:my_own_sm/consumer/my_own_sm_consumer.dart';
import 'package:my_own_sm/presentation/controllers/products_notifier.dart';

class ProductsWidget extends StatefulWidget {
  final int value;
  const ProductsWidget({
    super.key,
    required this.value,
  });

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final productsNotifier = GetIt.instance<IProductNotifier>();
  @override
  void initState() {
    super.initState();
    productsNotifier.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MyOwnSmConsumer(
        listenable: productsNotifier,
        builder: (context) {
          final state = productsNotifier.value;
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
                  productsNotifier.getProducts();
                },
                child: const Text("Reload"),
              );
          }
        });
  }
}
