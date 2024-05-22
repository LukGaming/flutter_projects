import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/todo_controller.dart';

void injector() {
  GetIt i = GetIt.instance;

  i.registerSingleton(TodoController());
}
