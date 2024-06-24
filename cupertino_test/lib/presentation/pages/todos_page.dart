import 'package:cupertino_test/presentation/controllers/todo_controller.dart';
import 'package:cupertino_test/presentation/models/base_state.dart';
import 'package:cupertino_test/presentation/models/todo.dart';
import 'package:cupertino_test/presentation/widgets/todos_list_view_widget.dart';
import 'package:flutter/cupertino.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final _todoController = TodoController();
  void callback() {
    setState(() {});
  }

  @override
  void initState() {
    _todoController.addListener(callback);
    _todoController.getTodos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = _todoController.value;
    return switch (state) {
      LoadingState() => const Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      SuccessState<List<Todo>>() => TodosListViewWidget(todos: state.data),
      _ => Container()
    };
  }

  @override
  void dispose() {
    _todoController.removeListener(callback);
    super.dispose();
  }
}
