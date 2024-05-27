import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  bool _showAsFavoriteCheckBoxValue = false;

  void setShowFavorite(bool value) {
    _showAsFavoriteCheckBoxValue = value;
    setState(() {});
  }

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
              InkWell(
                onTap: () => setShowFavorite(!_showAsFavoriteCheckBoxValue),
                child: Row(
                  children: [
                    Checkbox(
                        value: _showAsFavoriteCheckBoxValue,
                        onChanged: (value) =>
                            value != null ? setShowFavorite(value) : null),
                    const Text("Marcar como favorito"),
                  ],
                ),
              ),
              InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => IntrinsicHeight(
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text("Selecionar Imagem da galeria"),
                              onTap: () async {
                                FilePickerResult? pickedFile =
                                    await FilePicker.platform.pickFiles(
                                  allowMultiple: false,
                                  allowedExtensions: ["JPG", "PNG", "JPEG"],
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text("Tirar foto"),
                              onTap: () async {
                                XFile? pickedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.file_copy),
                      SizedBox(width: 20),
                      Text("Enviar arquivo"),
                    ],
                  )),
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
