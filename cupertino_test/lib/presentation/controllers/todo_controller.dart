import 'package:cupertino_test/presentation/models/base_state.dart';
import 'package:cupertino_test/presentation/models/todo.dart';
import 'package:flutter/cupertino.dart';

class TodoController extends ValueNotifier<BaseState> {
  TodoController() : super(InitialState());

  Future<void> getTodos() async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 2));
    value = SuccessState([
      Todo(id: 1, name: "primeiro todo"),
      Todo(id: 2, name: "segundo todo"),
    ]);
  }

  Future<void> addTodo(Todo todo) async {
    if (value is SuccessState) {
      (value as SuccessState<List<Todo>>).data.add(todo);
      notifyListeners();
    }
  }
}
