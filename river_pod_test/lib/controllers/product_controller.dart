// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:river_pod_test/base/state/base_state.dart';
import 'package:river_pod_test/mock/products.dart';
import 'package:river_pod_test/models/product.dart';

final productProvider = StateNotifierProvider<ProductController, BaseState>(
    (ref) => ProductController());

class ProductController extends StateNotifier<BaseState> {
  ProductController() : super(LoadingState());

  void getProducts() async {
    print("Loading products");
    await Future.delayed(const Duration(seconds: 1));
    state = ProductsLoaded(products: productList);
  }
}

class ProductsLoaded extends BaseState {
  List<Product> products;
  ProductsLoaded({
    required this.products,
  });
}
