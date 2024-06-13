// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_own_sm/base/models/base_state.dart';
import 'package:my_own_sm/infrastructure/repositories/product_repository.dart';

import 'package:my_own_sm/base/state_managment/my_own_notifier.dart';

import 'package:my_own_sm/models/types/typedefs.dart';

abstract class IProductNotifier extends MyOwnNotifier<BaseState> {
  IProductNotifier(super.state);
  void getProducts();
}

class ProductsNotifier extends IProductNotifier {
  final _productRepository = ProductsRepository();
  ProductsNotifier() : super(InitialState());
  @override
  void getProducts() async {
    value = LoadingState();
    value = SuccessState<ProductsList>(
        data: await _productRepository.getProducts());
  }
}
