import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:object_box/domain/entities/todo.dart';

class TodoController extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void getTodos() async {
    setIsloading(true);
    for (int i = 0; i < 20; i++) {
      _todos.add(
        Todo(
          id: i,
          name: Faker().person.name(),
          body: Faker().lorem.sentence(),
          done: Faker().randomGenerator.boolean(),
        ),
      );
    }

    await Future.delayed(const Duration(seconds: 1));
    setIsloading(false);
  }

  void setIsloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setTodoDone(Todo todo, bool value) {
    int todoIndex = _todos.indexWhere((element) => element.id == todo.id);
    _todos[todoIndex] = todo.copyWith(done: value);
    notifyListeners();
  }

  void create({
    required Todo todo,
    required BuildContext context,
  }) async {
    _todos.add(todo);
    notifyListeners();
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Todo criado com sucesso!"),
      ),
    );
  }
}
