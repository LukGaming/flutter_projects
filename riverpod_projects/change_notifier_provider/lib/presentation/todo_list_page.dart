import 'package:change_notifier_provider/models/todo.dart';
import 'package:change_notifier_provider/notifiers/todos_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListPage extends ConsumerStatefulWidget {
  const TodoListPage({super.key});

  @override
  ConsumerState<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends ConsumerState<TodoListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todosProvider.notifier).getTodos();
    });
  }

  void getTodos() {
    ref.read(todosProvider.notifier).getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todosNotifier = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo list "),
      ),
      body: renderTodoList(todosNotifier.todos),
    );
  }
}

Widget renderTodoList(List<Todo> todos) {
  return Consumer(builder: (context, ref, widget) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text(
          todos[index].id.toString(),
        ),
        title: Text(
          todos[index].name,
          maxLines: 1,
          style: TextStyle(
            color: todos[index].completed ? Colors.red : null,
            decoration: todos[index].completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
            value: todos[index].completed,
            onChanged: (val) {
              ref
                  .read(todosProvider)
                  .updateTodo(todos[index].copyWith(completed: val));
            }),
      ),
    );
  });
}
