import 'package:cupertino_test/presentation/controllers/todo_controller.dart';
import 'package:get_it/get_it.dart';

Future<void> locator() async {
  GetIt i = GetIt.instance;
  i.registerSingleton(TodoController());
}
