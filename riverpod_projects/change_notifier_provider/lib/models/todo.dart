// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  int id;
  String name;
  bool completed;
  Todo({
    required this.id,
    required this.name,
    required this.completed,
  });

  Todo copyWith({
    int? id,
    String? name,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      completed: completed ?? this.completed,
    );
  }
}
