import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/domain/interfaces/abstract_todo_repository.dart';
import 'package:objectbox/objectbox.dart';

class TodoRepository implements ITodoRepository {
  final Box<Todo> todoBox;

  TodoRepository(this.todoBox);
  @override
  Future<List<Todo>> getTodos() async {
    return todoBox.getAll();
  }

  @override
  Future<Todo> saveTodo(Todo todo) async {
    var createdId = await todoBox.putAsync(todo);
    return todo.copyWith(id: createdId);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await todoBox.removeAsync(todo.id!);
  }
}
