import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_test/presentation/controllers/product_controller.dart';
import 'package:sqflite_test/presentation/functions/form_layout_decorations.dart';
import 'package:sqflite_test/presentation/models/category.dart';

class CreateCategoryWidget extends StatefulWidget {
  const CreateCategoryWidget({super.key});

  @override
  State<CreateCategoryWidget> createState() => _CreateCategoryWidgetState();
}

class _CreateCategoryWidgetState extends State<CreateCategoryWidget> {
  final _productManagerController = GetIt.instance<ProductManagerController>();
  final _formKey = GlobalKey<FormState>();
  final _categoryNameEditingController = TextEditingController();

  validade() {
    if (_formKey.currentState?.validate() == true) {
      Navigator.of(context).pop();
      _productManagerController.addCategory(
        Category(
          name: _categoryNameEditingController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _productManagerController,
        builder: (context, child) {
          return IntrinsicHeight(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _categoryNameEditingController,
                      decoration:
                          defaultInputDecoration(label: "Nome da categoria"),
                      validator: (value) => value == null || value == ""
                          ? "Por favor, de um nome a categoria."
                          : null,
                    ),
                    heightGap,
                    defaultSubmitButton(
                      callbackFunction: () => validade(),
                      buttonText: "Criar Categoria",
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
