import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoGalleryPicker extends StatefulWidget {
  final Function(XFile pickedPhoto) onPickedPhoto;
  const PhotoGalleryPicker({super.key, required this.onPickedPhoto});

  @override
  _PhotoGalleryPickerState createState() => _PhotoGalleryPickerState();
}

class _PhotoGalleryPickerState extends State<PhotoGalleryPicker> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.onPickedPhoto(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.photo_library),
      title: const Text('Pick Image from Gallery'),
      onTap: _pickImage,
    );
  }
}
