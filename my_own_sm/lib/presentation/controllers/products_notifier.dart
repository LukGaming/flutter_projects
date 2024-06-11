// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_own_sm/base/base_state.dart';
import 'package:my_own_sm/infrastructure/repositories/product_repository.dart';

import 'package:my_own_sm/base/state_managment/my_own_notifier.dart';

import 'package:my_own_sm/models/types/typedefs.dart';

class ProductsNotifier extends MyOwnNotifier<BaseState> {
  final _productRepository = ProductsRepository();
  ProductsNotifier() : super(InitialState());

  void getProducts() async {
    value = LoadingState();
    value = SuccessState<productsType>(
        data: await _productRepository.getProducts());
  }
}
