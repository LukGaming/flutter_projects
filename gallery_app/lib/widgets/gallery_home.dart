import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/gallery_controller.dart';

class GalleryHome extends StatefulWidget {
  const GalleryHome({super.key});

  @override
  State<GalleryHome> createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome> {
  final _galleryController = GalleryController();
  @override
  void initState() {
    _galleryController.loadGalleryItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _galleryController,
        builder: (_, __) {
          if (_galleryController.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (_galleryController.galleryItems.isEmpty) {
            return const Center(
              child: Text("Nenhum item criado."),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Image.network(
              _galleryController.galleryItems[index].imagePath,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text("Imagem não encontrada"),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            itemCount: _galleryController.galleryItems.length,
          );
        },
      ),
    );
  }
}
