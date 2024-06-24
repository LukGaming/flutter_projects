import 'package:cupertino_test/presentation/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodosListViewWidget extends StatelessWidget {
  final List<Todo> todos;
  const TodosListViewWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          color: CupertinoColors.systemGrey,
          child: CupertinoListTile(
            title: Text(
              todos[index].name,
            ),
          ),
        );
      },
    );
  }
}
