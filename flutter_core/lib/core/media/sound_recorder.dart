import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordAudio extends StatefulWidget {
  const RecordAudio({super.key});

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
      await _recorder!.openRecorder();
      await _recorder!.startRecorder(toFile: path);
      _isRecordingAudio = true;
      _audioPath = path;
      setState(() {});
    }
  }

  Future<void> _stopRecordingAudio() async {
    if (_isRecordingAudio) {
      await _recorder!.stopRecorder();
      setState(() {
        _isRecordingAudio = false;
      });
    }
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _isRecordingAudio ? Icons.mic : Icons.mic_off,
          size: 100.0,
          color: _isRecordingAudio ? Colors.red : Colors.grey,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed:
              _isRecordingAudio ? _stopRecordingAudio : _startRecordingAudio,
          child: Text(_isRecordingAudio ? 'Stop Recording' : 'Start Recording'),
        ),
        if (_audioPath != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Saved to: $_audioPath'),
          ),
      ],
    );
  }
}
