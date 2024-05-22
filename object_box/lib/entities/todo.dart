// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  int? id;
  String name;
  String body;
  bool done;
  Todo({
    required this.id,
    required this.name,
    required this.body,
    required this.done,
  });

  Todo copyWith({
    int? id,
    String? name,
    String? body,
    bool? done,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      body: body ?? this.body,
      done: done ?? this.done,
    );
  }
}
