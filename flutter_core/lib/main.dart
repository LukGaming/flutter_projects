import 'package:flutter/material.dart';
import 'package:flutter_core/core/infra/injector_imp.dart';
import 'package:flutter_core/core/infra/locator_imp.dart';
import 'package:flutter_core/core/media/camera_picker.dart';
import 'package:flutter_core/core/media/photo_gallery_picker.dart';
import 'package:flutter_core/core/media/record_video.dart';
import 'package:flutter_core/core/media/sound_recorder.dart';
import 'package:flutter_core/core/presentation/controllers/messaging_controller.dart';
import 'package:flutter_core/core/presentation/messages_widgets/snackbar_widget.dart';

void main() async {
  await locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => ShowSnackBarWidget(child: child!),
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _messageController = DependencyInjector().get<MessagingController>();
    int snackbarCounter = 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _messageController.showSnackbar(
                  snackBar: SnackBar(
                    showCloseIcon: true,
                    content: Text("Texto da snackbar $snackbarCounter"),
                  ),
                  closePreviousSnackBar: false,
                );
                snackbarCounter++;
              },
              child: const Text("Mostrar Snackbar"),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        CameraPicker(
                          onPickedImage: (image) {},
                        ),
                        VideoRecorder(
                          onPickedVideo: (video) {},
                        ),
                        PhotoGalleryPicker(
                          onPickedPhoto: (pickedPhoto) {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.mic),
                          title: const Text("Record Audio"),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: RecordAudio(),
                                );
                              },
                            );
                          },
                        ),
                        // RecordAudio(),
                      ],
                    );
                  },
                );
              },
              child: const Text("Mostrar opções de Media"),
            )
          ],
        ),
      ),
    );
  }
}
