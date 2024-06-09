import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_future_provider/todo.dart';

final todoResponseProvider = FutureProvider<TodoResponse>((ref) {
  return getTodos();
});

Future<TodoResponse> getTodos() async {
  final httpResponse =
      await Dio().get('https://dummyjson.com/todos?limit=3&skip=10');
  print(httpResponse.data as Map<String, dynamic>);
  return TodoResponse.fromJson(httpResponse.data as Map<String, dynamic>);
}
