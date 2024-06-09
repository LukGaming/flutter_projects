import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_future_provider/todo.dart';

final todoResponseProvider = FutureProvider<TodoResponse>((ref) {
  return getTodos();
});

final updateTodoProvider =
    FutureProvider.family((ref, Todo todo) => updateTodo(todo));

Future<TodoResponse> getTodos() async {
  final httpResponse =
      await Dio().get('https://dummyjson.com/todos?limit=3&skip=10');

  return TodoResponse.fromJson(httpResponse.data as Map<String, dynamic>);
}

Future updateTodo(Todo todo) async {
  print("updating todo");
  await Dio().post(
    'https://dummyjson.com/todos/${todo.id}',
    data: todo.toMap(),
  );
}
