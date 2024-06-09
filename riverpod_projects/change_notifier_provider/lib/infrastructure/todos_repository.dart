import 'package:change_notifier_provider/faker/todo_list.dart';
import 'package:change_notifier_provider/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosRepository {
  Future<List<Todo>> getTodos() async {
    return generateFakeTodoList(numberOfTodos: 15);
  }
}

final repositoryProvider =
    Provider<TodosRepository>((ref) => TodosRepository());
