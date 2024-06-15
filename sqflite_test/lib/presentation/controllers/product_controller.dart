import 'package:flutter/material.dart';
import 'package:sqflite_test/infrastructure/repositories/category_repository.dart';
import 'package:sqflite_test/infrastructure/repositories/products_repository.dart';
import 'package:sqflite_test/presentation/models/category.dart';
import 'package:sqflite_test/presentation/models/product.dart';

class ProductManagerController extends ChangeNotifier {
  final IProductRepository _productRepository;
  final ICategoryRepository _categoryRepository;
  ProductManagerController(this._productRepository, this._categoryRepository);

  List<Product> products = [];
  List<Category> categories = [];
  bool isLoading = false;

  Future<void> _getProducts() async {
    products = await _productRepository.get();
  }

  Future<void> addProduct(Product product) async {
    products.add(await _productRepository.save(product));
    notifyListeners();
  }

  Future<void> addCategory(Category category) async {
    categories.add(await _categoryRepository.create(category));
    notifyListeners();
  }

  Future<void> _getCategories() async {
    categories = await _categoryRepository.get();
  }

  Future<void> init() async {
    setIsloading(true);
    await _getCategories();
    await _getProducts();

    setIsloading(false);
  }

  void setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
