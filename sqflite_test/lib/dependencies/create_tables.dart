import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_test/db/tables/category.dart';
import 'package:sqflite_test/db/tables/product_table.dart';

Future<void> createTables(Database db) async {
  await db.execute(CategoryTable.createTableCommand);
  await db.execute(ProductTable.createTableCommand);
}
