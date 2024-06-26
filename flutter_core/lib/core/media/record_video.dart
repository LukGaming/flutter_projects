import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoRecorder extends StatefulWidget {
  final Function(XFile video) onPickedVideo;

  const VideoRecorder({super.key, required this.onPickedVideo});
  @override
  _VideoRecorderState createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _recordVideo() async {
    final pickedVideo = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedVideo != null) {
      widget.onPickedVideo(pickedVideo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.videocam),
      title: Text('Record Video'),
      onTap: _recordVideo,
    );
  }
}
