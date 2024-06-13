import 'package:flutter/material.dart';
import 'package:state_pattern_value_notifier/base_state.dart';
import 'package:state_pattern_value_notifier/product.dart';

class ProductNotifier extends ValueNotifier<BaseState> {
  ProductNotifier() : super(LoadingState());

  void getProducts() async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 2));
    value = SuccessState(
      data: [
        Product(
          id: 1,
          name: "Produto 1",
        ),
        Product(
          id: 2,
          name: "Produto 1",
        ),
      ],
    );
  }

  void generateError() {
    value =
        ErrorState(error: Exception("Ocorreu um erro ao atualizar produtos"));
  }
}
