import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/theme_controller.dart';
import 'package:object_box/controllers/todo_controller.dart';
import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/domain/interfaces/Itodo_repository.dart';
import 'package:object_box/infrastructure/repositories/todo_repository.dart';
import 'package:object_box/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localstorage/localstorage.dart';

Future<void> injector() async {
  GetIt i = GetIt.instance;

  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  var directory = await getApplicationDocumentsDirectory();

  Store store = await openStore(directory: directory.path);

  i.registerLazySingleton<ITodoRepository>(
    () => TodoRepository(store.box<Todo>()),
  );

  i.registerLazySingleton(() => TodoController(i()));

  i.registerLazySingleton(
    () => ThemeController(),
  );
}
