import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  int id = 0;
  String name;
  bool done;
  Todo({
    required this.id,
    required this.name,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'done': done,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      name: map['name'] as String,
      done: map['done'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(
    Map<String, dynamic> json,
  ) {
    print('json: ${json['name']}');
    return Todo(
      id: json['id'],
      name: json['name'],
      done: json['done'],
    );
  }
}
