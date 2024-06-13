// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductNotifier extends ValueNotifier<BaseState> {
  ProductNotifier() : super(InitialState());

  void getProducts() async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 2));
    try {
      value = ProductsLoaded([
        Product(id: 1, name: "Primeiro produto!"),
        Product(id: 2, name: "Segundo produto!"),
      ]);
    } catch (e) {
      value = ErrorState(error: "Erro ao carregar produtos");
    }
  }

  void generateError() {
    value = ErrorState(error: "Estado de erro gerado manualmente");
  }
}

class Product {
  int? id;
  String name;
  Product({this.id, required this.name});
}

//Estado base

//Estado inicial

//Estado carregando

//Estado de Produtos carregados

//Estado de erro

abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class ProductsLoaded extends BaseState {
  List<Product> productList;
  ProductsLoaded(this.productList);
}

class ErrorState extends BaseState {
  String error;
  ErrorState({required this.error});
}
