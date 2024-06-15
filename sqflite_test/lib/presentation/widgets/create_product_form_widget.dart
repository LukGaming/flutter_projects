import 'package:flutter/material.dart';
import 'package:sqflite_test/presentation/models/category.dart';

class CreateProductFormWidget extends StatefulWidget {
  const CreateProductFormWidget({super.key});

  @override
  State<CreateProductFormWidget> createState() =>
      _CreateProductFormWidgetState();
}

class _CreateProductFormWidgetState extends State<CreateProductFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _productNameEditingController = TextEditingController();
  final _productPriceEditingController = TextEditingController();

  List<Category> categories = [
    Category(id: 1, name: "Categoria 1"),
    Category(id: 2, name: "Categoria 2"),
  ];

  @override
  void initState() {
    super.initState();
  }

  final heightGap = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameEditingController,
            decoration: const InputDecoration(
              label: Text("Nome do Produto"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
          heightGap,
          TextFormField(
            controller: _productPriceEditingController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              label: Text("Valor do Produto"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
          heightGap,
          DropdownButtonFormField<Category>(
            decoration: InputDecoration(
              labelText: "Selecionar Categoria",
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              suffixIcon: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("Criando Categoria"),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
            isExpanded: true,
            onChanged: (Category? value) {
              print(value);
            },
            items: categories
                .map<DropdownMenuItem<Category>>(
                  (Category e) => DropdownMenuItem<Category>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
          ),
          heightGap,
          ElevatedButton(onPressed: () {}, child: const Text("Criar Produto"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _productNameEditingController.dispose();
    _productPriceEditingController.dispose();
  }
}
