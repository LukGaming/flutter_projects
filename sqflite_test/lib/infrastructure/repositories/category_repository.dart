// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';

import 'package:sqflite_test/category.dart';
import 'package:sqflite_test/db/tables/category.dart';

abstract class ICategoryRepository {
  Future<List<Category>> get();
  Future<Category> create(Category category);
  Future<Category> update(Category category);
  Future<void> delete(Category category);
}

class CategoryRepository implements ICategoryRepository {
  Database db;
  CategoryRepository({
    required this.db,
  });

  @override
  Future<Category> create(Category category) async {
    return category.copyWith(
        id: await db.insert(CategoryTable.tableName, category.toMap()));
  }

  @override
  Future<void> delete(Category category) async {
    await db.delete(CategoryTable.tableName,
        where: "${CategoryTable.idColumn} = ${category.id}");
  }

  @override
  Future<List<Category>> get() async {
    final result = await db.query(CategoryTable.tableName);
    return result.map((element) => Category.fromMap(element)).toList();
  }

  @override
  Future<Category> update(Category category) async {
    print("${CategoryTable.idColumn} = ${category.id}");
    await db.update(
      CategoryTable.tableName,
      category.toMap(),
      where: "${CategoryTable.idColumn} = ${category.id}",
    );
    return category;
  }
}
