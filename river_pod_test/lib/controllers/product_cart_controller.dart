import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/models/product.dart';

class ProductCartController extends StateNotifier<List<Product>> {
  ProductCartController() : super([]);

  void addProductToCard(Product product) {
    print("Adicionando produto ao carrinho");
    if (!state.contains(product)) {
      state = [...state, product];
      return;
    }

    if (state.contains(product)) {
      state = [...state.where((element) => element.id != product.id)];
    }
  }
}

final productCartNotifier =
    StateNotifierProvider<ProductCartController, List<Product>>(
  (ref) => ProductCartController(),
);
