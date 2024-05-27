import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/gallery_controller.dart';
import 'package:gallery_app/models/gallery_item.dart';
import 'package:gallery_app/widgets/gallery_bottom_navigation.dart';
import 'package:get_it/get_it.dart';

class GalleryHome extends StatefulWidget {
  const GalleryHome({super.key});

  @override
  State<GalleryHome> createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome> {
  final _galleryController = GetIt.instance<GalleryController>();
  var currentIndex = 0;
  @override
  void initState() {
    _galleryController.loadGalleryItems();
    super.initState();
  }

  void changeNavigationBarIndex(int value) {
    currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigatorBarWidget(),
      floatingActionButton: AddFloatingActionButton(),
      body: ListenableBuilder(
        listenable: _galleryController,
        builder: (_, __) {
          print(_galleryController.showFavorite);
          List<GalleryItem> galleryItems = [];
          final showFavorites = _galleryController.showFavorite;
          if (showFavorites) {
            galleryItems = _galleryController.galleryItems
                .where((element) => element.isFavorite == true)
                .toList();
          } else {
            galleryItems = _galleryController.galleryItems;
          }

          if (_galleryController.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (galleryItems.isEmpty) {
            return const Center(
              child: Text("Nenhum item criado."),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Image.network(
              galleryItems[index].imagePath,
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
            itemCount: galleryItems.length,
          );
        },
      ),
    );
  }
}

class AddFloatingActionButton extends StatelessWidget {
  AddFloatingActionButton({
    super.key,
  });
  final _galleryController = GetIt.instance<GalleryController>();
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _galleryController,
      builder: (_, __) {
        return _galleryController.isLoading
            ? Container()
            : FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              );
      },
    );
  }
}
