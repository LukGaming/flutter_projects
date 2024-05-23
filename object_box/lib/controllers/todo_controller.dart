import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/domain/interfaces/abstract_todo_repository.dart';

class TodoController extends ChangeNotifier {
  final ITodoRepository todoRepository;
  TodoController(this.todoRepository);

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void getTodos() async {
    setIsloading(true);
    _todos = [];
    _todos = await todoRepository.getTodos();
    _todos.forEach((element) => print(element.id));
    setIsloading(false);
  }

  void setIsloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setTodoDone(Todo todo, bool value) async {
    int todoIndex = _todos.indexWhere((element) => element.id == todo.id);
    _todos[todoIndex] = todo.copyWith(done: value);

    await todoRepository.saveTodo(todo);
    notifyListeners();
  }

  void create({
    required Todo todo,
    required BuildContext context,
  }) async {
    _todos.add(await todoRepository.saveTodo(todo));
    notifyListeners();

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Todo criado com sucesso!"),
      ),
    );
  }

  void removeTodo({
    required Todo todo,
    required BuildContext context,
  }) async {
    _todos.remove(todo);

    await todoRepository.deleteTodo(todo);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Todo removido com sucesso!"),
      ),
    );

    notifyListeners();
  }
}
