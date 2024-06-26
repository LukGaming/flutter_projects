import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/presentation/controllers/theme_controller.dart';
import 'package:object_box/presentation/controllers/todo_controller.dart';
import 'package:object_box/enums/theme.dart';
import 'package:object_box/presentation/pages/create_todo_page.dart';
import 'package:object_box/presentation/widgets/todo_widget.dart';

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
    final _themeController = GetIt.instance<ThemeController>();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListenableBuilder(
              listenable: _themeController,
              builder: (_, __) {
                return ListTile(
                  leading: Checkbox(
                    value:
                        _themeController.theme == ETheme.light ? false : true,
                    onChanged: (value) {
                      if (value != null) {
                        _themeController.setTheme(
                            value == true ? ETheme.dark : ETheme.light);
                      }
                    },
                  ),
                  title: const Text("Tema escuro"),
                );
              },
            )
          ],
        ),
      ),
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
