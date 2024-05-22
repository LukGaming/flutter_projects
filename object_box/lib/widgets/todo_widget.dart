import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/todo_controller.dart';
import 'package:object_box/domain/entities/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final _todoController = GetIt.instance<TodoController>();
    return ListTile(
      leading: Checkbox(
        value: todo.done,
        onChanged: (value) => {
          if (value != null) {_todoController.setTodoDone(todo, value)}
        },
      ),
      title: Text(todo.name),
      subtitle: Text(
        todo.body,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
