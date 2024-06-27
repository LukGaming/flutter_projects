import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

enum EAudioRecordStatus {
  initial,
  recording,
  stopped,
  finished,
}

IconData getIconFromRecordingStatus(EAudioRecordStatus status) {
  switch (status) {
    case EAudioRecordStatus.initial:
      return Icons.mic;

    default:
      return Icons.mic_off;
  }
}

Color getColorFromRecordingStatus(EAudioRecordStatus status) {
  switch (status) {
    case EAudioRecordStatus.initial:
      return Colors.grey;

    default:
      return Colors.red;
  }
}

class RecordAudio extends StatefulWidget {
  const RecordAudio({super.key});

  @override
  _RecordAudioState createState() => _RecordAudioState();
}

class _RecordAudioState extends State<RecordAudio> {
  FlutterSoundRecorder? _recorder;
  EAudioRecordStatus recordingStatus = EAudioRecordStatus.initial;
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

      recordingStatus = EAudioRecordStatus.recording;
      _audioPath = path;
      setState(() {});
    }
  }

  Future<void> _stopRecordingAudio() async {
    if (recordingStatus == EAudioRecordStatus.recording) {
      await _recorder!.stopRecorder();
      recordingStatus = EAudioRecordStatus.finished;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final IconData recordingIcon = getIconFromRecordingStatus(recordingStatus);
    final Color iconColor = getColorFromRecordingStatus(recordingStatus);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          recordingIcon,
          size: 100.0,
          color: iconColor,
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            ElevatedButton(
              onPressed: recordingStatus == EAudioRecordStatus.recording
                  ? _stopRecordingAudio
                  : _startRecordingAudio,
              child: Text(
                recordingStatus == EAudioRecordStatus.recording
                    ? 'Stop Recording'
                    : 'Start Recording',
              ),
            ),
            recordingStatus == EAudioRecordStatus.finished
                ? Container(
                    color: Colors.blue,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
