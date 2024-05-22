import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/todo_controller.dart';
import 'package:object_box/pages/create_todo_page.dart';
import 'package:object_box/widgets/todo_widget.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final _todosController = GetIt.instance<TodoController>();
  @override
  void initState() {
    _todosController.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todos"),
      ),
      body: ListenableBuilder(
        listenable: _todosController,
        builder: (context, child) {
          if (_todosController.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => TodoWidget(
              todo: _todosController.todos[index],
            ),
            itemCount: _todosController.todos.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CreateTodoPage(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
