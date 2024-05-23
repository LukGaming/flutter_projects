import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  @Id()
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
