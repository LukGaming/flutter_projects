import 'package:sqflite_test/db/tables/category.dart';

class ProductTable {
  static const tableName = "product";
  static const idColumn = "id";
  static const nameColumn = "name";
  static const priceColumn = "price";
  static const foreingCategoryColumn = "category_id";
  static const foreingKeyCommand =
      "FOREIGN KEY ($foreingCategoryColumn) REFERENCES ${CategoryTable.tableName}(id)";
  static const primaryKey = "INTEGER PRIMARY KEY";

  static const createTableCommand = """
  CREATE TABLE IF NOT EXISTS $tableName 
    ($idColumn $primaryKey, $nameColumn TEXT, $foreingCategoryColumn int , $priceColumn decimal,$foreingKeyCommand)
  """;
}
