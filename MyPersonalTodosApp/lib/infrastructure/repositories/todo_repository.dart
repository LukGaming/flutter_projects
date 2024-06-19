import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/domain/interfaces/Itodo_repository.dart';
import 'package:objectbox/objectbox.dart';

class TodoRepository implements ITodoRepository {
  final Box<Todo> todoBox;

  TodoRepository(this.todoBox);

  @override
  Future<void> delete(Todo todo) async {
    todoBox.remove(todo.id!);
  }

  @override
  Future<List<Todo>> get() async {
    return todoBox.getAll();
  }

  @override
  Future<Todo> save(Todo todo) async {
    var createdId = todoBox.put(todo);
    return todo.copyWith(id: createdId);
  }
}
