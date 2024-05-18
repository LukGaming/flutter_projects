import 'dart:convert';

import 'package:gazelle_core/gazelle_core.dart';
import 'package:gazelle_test/domains/entities/todo.dart';

void main() async {
  List<Todo> todos = [
    Todo(id: 1, name: "Todo 1", done: true),
    Todo(id: 2, name: "Todo 2", done: false),
  ];

  final app = GazelleApp(
    port: 8080,
  );

  app.get('/todos', (request, response) async {
    return response.copyWith(
      statusCode: 200,
      body: transformTodosToString(todos),
    );
  });

  app.post('/todos', (request, response) async {
    var body = await request.body;

    Map<String, dynamic> jsonBody =
        Map<String, dynamic>.from(json.decode(body!));

    todos.add(Todo.fromJson(jsonBody));
    return response.copyWith(
      statusCode: 201,
      body: transformTodosToString(
        todos,
      ),
    );
  });

  await app.start();
}

String transformTodosToString(List<Todo> todos) {
  List<Map<String, dynamic>> todosResponse = [];
  todos.forEach(
    (element) => {
      todosResponse.add({
        'id': element.id ?? null,
        'name': element.name,
        'done': element.done
      })
    },
  );
  return json.encode(todosResponse);
}
