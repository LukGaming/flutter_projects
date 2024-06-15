class CategoryTable {
  static const idColumn = "id";
  static const tableName = "category";
  static const nameColumn = "name";
  static const primaryKey = "INTEGER PRIMARY KEY";
  static const createTableCommand = """
  CREATE TABLE IF NOT EXISTS $tableName 
    ($idColumn $primaryKey, $nameColumn TEXT)
  """;
}
