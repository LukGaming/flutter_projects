import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/presentation/controllers/todo_controller.dart';
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
        onChanged: (value) =>
            {if (value != null) _todoController.setTodoDone(todo, value)},
      ),
      title: Text(todo.name),
      subtitle: Text(
        todo.body,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
          onPressed: () async {
            bool? remove = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Row(
                  children: [
                    Text("Deseja remover o todo?"),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text("Remover"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("Cancelar"),
                      )
                    ],
                  ),
                ],
              ),
            );
            if (remove == true) {
              _todoController.removeTodo(todo);
            }
          },
          icon: const Icon(Icons.delete)),
    );
  }
}
