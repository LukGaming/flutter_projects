import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/gallery_controller.dart';
import 'package:get_it/get_it.dart';

class BottomNavigatorBarWidget extends StatelessWidget {
  BottomNavigatorBarWidget({
    super.key,
  });

  final _galleryController = GetIt.instance<GalleryController>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _galleryController,
        builder: (_, __) {
          if (_galleryController.isLoading) {
            return Container();
          }
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.photo),
                label: "Todas",
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favoritas",
                backgroundColor: Colors.red,
              ),
            ],
            currentIndex: _galleryController.currentIndex,
            onTap: (value) =>
                _galleryController.changeNavigationBarIndex(value),
          );
        });
  }
}
