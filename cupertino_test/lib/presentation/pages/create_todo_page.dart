import 'package:cupertino_test/presentation/controllers/todo_controller.dart';
import 'package:cupertino_test/presentation/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final _todoController = GetIt.instance<TodoController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameEditingController = TextEditingController();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Criando todos'),
      ),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CupertinoTextFormFieldRow(
                style: const TextStyle(color: Colors.white),
                placeholder: "Nome do todo",
                placeholderStyle: const TextStyle(color: Colors.white),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                controller: nameEditingController,
              ),
              CupertinoButton(
                child: const Text("Salvar"),
                onPressed: () async {
                  await _todoController.addTodo(
                    Todo(
                      name: nameEditingController.text,
                    ),
                  );
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
