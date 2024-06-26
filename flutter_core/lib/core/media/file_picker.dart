import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerTile extends StatefulWidget {
  const FilePickerTile({super.key});

  @override
  _FilePickerTileState createState() => _FilePickerTileState();
}

class _FilePickerTileState extends State<FilePickerTile> {
  List<String> _filePaths = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _filePaths = result.files.map((e) => e.path!).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.attach_file),
          title: Text('Pick Files'),
          onTap: _pickFiles,
        ),
        if (_filePaths != null)
          Column(
            children: _filePaths!
                .map((path) => ListTile(
                      title: Text(path ?? 'Invalid path'),
                    ))
                .toList(),
          ),
      ],
    );
  }
}
