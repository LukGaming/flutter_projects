import 'package:object_box/domain/entities/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo> saveTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);
}
