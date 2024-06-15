import 'dart:io';

import 'package:get_it/get_it.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_test/dependencies/create_tables.dart';
import 'package:sqflite_test/infrastructure/repositories/category_repository.dart';
import 'package:sqflite_test/infrastructure/repositories/products_repository.dart';
import 'package:sqflite_test/presentation/controllers/product_controller.dart';

Future<void> locator() async {
  GetIt i = GetIt.instance;
  late Database database;

  if (Platform.isWindows) {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
    );
  } else {
    database = await openDatabase(
      "my_db.db",
    );
  }

  await createTables(database);

  i.registerLazySingleton<Database>(() => database);

  i.registerLazySingleton<IProductRepository>(() => ProductRepository(i()));

  i.registerLazySingleton<ProductManagerController>(
      () => ProductManagerController(i(), i()));

  i.registerLazySingleton<ICategoryRepository>(
      () => CategoryRepository(db: i()));
}
