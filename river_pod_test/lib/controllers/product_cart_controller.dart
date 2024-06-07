import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/models/product.dart';

class ProductCartController extends StateNotifier<List<Product>> {
  ProductCartController() : super([]);

  void addProductToCard(Product product) {
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }
}
