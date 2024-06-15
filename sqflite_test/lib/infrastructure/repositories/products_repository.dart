import 'package:sqflite_test/category.dart';
import 'package:sqflite_test/product.dart';

abstract class ProductRepository {
  Future<Product> save(Product product);
  Future<List<Product>> get();
  Future<Product> update(Product product);
  Future<void> delete(Product product);
  Future<List<Product>> findProductByCategory(Category category);
}
