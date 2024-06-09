import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  int id;
  String todo;
  bool completed;
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
  });

  Todo copyWith({
    int? id,
    String? todo,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
    );
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    print(map['id'].runtimeType);
    return Todo(
      id: map['id'] as int,
      todo: map['todo'] as String,
      completed: map['completed'] as bool,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> source) => Todo.fromMap(source);
}

class TodoResponse {
  List<Todo> todos;
  int total;
  int skip;
  int limit;
  TodoResponse({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TodoResponse.fromMap(Map<String, dynamic> map) {
    return TodoResponse(
      todos: List<Todo>.from(
        (map['todos'] as List<int>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'],
      skip: map['skip'],
      limit: map['limit'],
    );
  }

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      todos: (json['todos'] as List)
          .map((element) => Todo.fromJson(element))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
