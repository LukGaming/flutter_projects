import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/todo_controller.dart';
import 'package:object_box/domain/entities/todo.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final _todoController = GetIt.instance<TodoController>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Todo!"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text("Nome")),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Por favor preencha o campo de nome.";
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Corpo")),
                  controller: _bodyController,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Por favor preencha o corpo do Todo.";
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    var formIsValid = _formKey.currentState?.validate();
                    if (formIsValid == true) {
                      _todoController.create(
                        context: context,
                        todo: Todo(
                          id: null,
                          name: _nameController.text,
                          body: _bodyController.text,
                          done: false,
                        ),
                      );
                    }
                  },
                  child: const Text("Create todo"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
