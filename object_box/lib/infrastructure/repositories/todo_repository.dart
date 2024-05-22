import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/domain/interfaces/abstract_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<Todo> saveTodo() {
    // TODO: implement saveTodo
    throw UnimplementedError();
  }
}
