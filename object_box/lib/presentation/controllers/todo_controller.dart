// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/domain/interfaces/Itodo_repository.dart';

class TodoController extends ChangeNotifier {
  final ITodoRepository todoRepository;
  TodoController(this.todoRepository);

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getTodos() async {
    setIsloading(true);
    _todos = [];

    _todos = await todoRepository.get();
    setIsloading(false);
  }

  void setTodos(List<Todo> todos) {
    _todos = todos;
  }

  void setIsloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> setTodoDone(Todo todo, bool value) async {
    int todoIndex = _todos.indexWhere((element) => element.id == todo.id);

    await todoRepository.save(todo.copyWith(done: value));

    _todos[todoIndex] = todo.copyWith(done: value);

    notifyListeners();
  }

  Future<void> create({
    required Todo todo,
    // required BuildContext context,
  }) async {
    _todos.add(await todoRepository.save(todo));
    notifyListeners();
    // Navigator.of(context).pop();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Todo criado com sucesso!"),
    //   ),
    // );
  }

  Future<void> removeTodo(
    Todo todo,
    // required BuildContext context,
  ) async {
    _todos.remove(todo);
    await todoRepository.delete(todo);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Todo removido com sucesso!"),
    //   ),
    // );

    notifyListeners();
  }
}
