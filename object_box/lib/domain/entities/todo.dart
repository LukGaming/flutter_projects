// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.body == body &&
        other.done == done;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ body.hashCode ^ done.hashCode;
  }
}
