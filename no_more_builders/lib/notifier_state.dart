// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class NotifierState extends ValueNotifier<BaseState> {
  NotifierState() : super(LoadingState());

  void changeToLoadingState() async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 2));
    List<Product> products = [];
    for (int i = 1; i < 101; i++) {
      products.add(
        Product(id: i, name: "Produto $i"),
      );
    }
    value = SuccessState(
      data: products,
    );
  }
}

abstract class BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T> extends BaseState {
  T data;
  SuccessState({
    required this.data,
  });
}

class Product {
  int? id;
  String name;
  Product({this.id, required this.name});
}
