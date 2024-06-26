import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordAudio extends StatefulWidget {
  @override
  _RecordAudioState createState() => _RecordAudioState();
}

class _RecordAudioState extends State<RecordAudio> {
  FlutterSoundRecorder? _recorder;
  bool _isRecordingAudio = false;
  String? _audioPath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
  }

  Future<void> _startRecordingAudio() async {
    if (await Permission.microphone.request().isGranted) {
      Directory appDir = await getApplicationDocumentsDirectory();
      String path =
          '${appDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';
      await _recorder!.startRecorder(toFile: path);
      setState(() {
        _isRecordingAudio = true;
        _audioPath = path;
      });
    }
  }

  Future<void> _stopRecordingAudio() async {
    if (_isRecordingAudio) {
      await _recorder!.stopRecorder();
      setState(() {
        _isRecordingAudio = false;
      });
      // Process the recorded audio
    }
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.mic),
      title: Text(_isRecordingAudio ? 'Stop Recording Audio' : 'Record Audio'),
      onTap: _isRecordingAudio ? _stopRecordingAudio : _startRecordingAudio,
    );
  }
}
