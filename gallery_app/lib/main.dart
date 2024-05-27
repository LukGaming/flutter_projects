import 'package:flutter/material.dart';
import 'package:gallery_app/dependency/injector.dart';
import 'package:gallery_app/widgets/gallery_home.dart';

void main() {
  injector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: false,
      ),
      home: const GalleryHome(),
    );
  }
}
