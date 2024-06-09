import 'package:change_notifier_provider/faker/todo_list.dart';
import 'package:change_notifier_provider/infrastructure/todos_repository.dart';
import 'package:change_notifier_provider/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosNotifier extends ChangeNotifier {
  final TodosRepository todosRepository;
  TodosNotifier(this.todosRepository);

  List<Todo> todos = [];

  void getTodos() {
    todos = generateFakeTodoList(numberOfTodos: 10);
    notifyListeners();
  }

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    final index = todos.indexWhere((e) => e.id == todo.id);
    todos[index] = todo;
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>(
    (ref) => TodosNotifier(ref.read(repositoryProvider)));
