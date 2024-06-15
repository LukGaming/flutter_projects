import 'package:sqflite/sqflite.dart';
import 'package:sqflite_test/presentation/models/category.dart';
import 'package:sqflite_test/db/tables/product_table.dart';
import 'package:sqflite_test/presentation/models/product.dart';

abstract class IProductRepository {
  Future<Product> save(Product product);
  Future<List<Product>> get();
  Future<Product> update(Product product);
  Future<void> delete(Product product);
  Future<List<Product>> findProductsByCategory(Category category);
}

class ProductRepository implements IProductRepository {
  final Database db;
  ProductRepository(this.db);

  @override
  Future<void> delete(Product product) async {
    await db.delete(ProductTable.tableName,
        where: "${ProductTable.idColumn} = ${product.id}");
  }

  @override
  Future<List<Product>> findProductsByCategory(Category category) async {
    final result = await db.query(ProductTable.tableName,
        where: "${ProductTable.foreingCategoryColumn} = ${category.id}");
    return result.map((e) => Product.fromMap(e)).toList();
  }

  @override
  Future<List<Product>> get() async {
    final result = await db.query(ProductTable.tableName);
    return result.map((e) => Product.fromMap(e)).toList();
  }

  @override
  Future<Product> save(Product product) async {
    int createdId = await db.insert(ProductTable.tableName, product.toMap());
    return product.copyWith(id: createdId);
  }

  @override
  Future<Product> update(Product product) async {
    await db.update(
      ProductTable.tableName,
      product.toMap(),
      where: "${ProductTable.idColumn} = ?",
      whereArgs: [product.id],
    );
    return product;
  }
}
