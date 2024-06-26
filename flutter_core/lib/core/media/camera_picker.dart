import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPicker extends StatefulWidget {
  final Function(XFile image) onPickedImage;
  const CameraPicker({super.key, required this.onPickedImage});

  @override
  _CameraPickerState createState() => _CameraPickerState();
}

class _CameraPickerState extends State<CameraPicker> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      widget.onPickedImage(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.camera_alt),
      title: const Text('Take Photo'),
      onTap: _takePhoto,
    );
  }
}
