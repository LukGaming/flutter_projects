import 'package:flutter/material.dart';

class CreateGalleryItemWidget extends StatefulWidget {
  const CreateGalleryItemWidget({super.key});

  @override
  State<CreateGalleryItemWidget> createState() =>
      _CreateGalleryItemWidgetState();
}

class _CreateGalleryItemWidgetState extends State<CreateGalleryItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando um novo item na galeria"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: textInputDecoration(labelText: "Nome do item"),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: textInputDecoration(labelText: "Descrição do item"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration textInputDecoration({
    required String labelText,
  }) =>
      InputDecoration(label: Text(labelText));
}
