import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/models/product.dart';

final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);


class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addProductToCard(Product product, WidgetRef ref) {
    if (!state.contains(product)) {
      state = [...state, product];
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(
          content: Text(
            "Produto adicionado ao carrinho",
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
      return;
    }

    if (state.contains(product)) {
      state = [...state.where((element) => element.id != product.id)];
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(
          content: Text("Produto removido do carrinho"),
          duration: Duration(milliseconds: 500),
        ),
      );
      return;
    }
  }
}
