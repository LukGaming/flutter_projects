// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:river_pod_test/base/state/base_state.dart';
import 'package:river_pod_test/mock/products.dart';
import 'package:river_pod_test/models/product.dart';

final productProvider = Provider((ref) => ProductController());

class ProductController extends StateNotifier<BaseState> {
  ProductController() : super(LoadingState());

  void getProducts() async {
    await Future.delayed(const Duration(seconds: 4));
    state = ProductsLoaded(products: productList);

  }


}

class ProductsLoaded extends BaseState {
  List<Product> products;
  ProductsLoaded({
    required this.products,
  });
}
