import 'package:object_box/domain/entities/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> get();
  Future<Todo> save(Todo todo);
  Future<void> delete(Todo todo);
}
