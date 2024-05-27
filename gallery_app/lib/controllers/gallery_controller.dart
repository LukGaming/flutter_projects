import 'package:flutter/material.dart';
import 'package:gallery_app/models/gallery_item.dart';

class GalleryController extends ChangeNotifier {
  List<GalleryItem> galleryItems = [];
  bool isLoading = true;
  bool showFavorite = false;
  int currentIndex = 0;

  void loadGalleryItems() async {
    setIsloading(true);
    // await Future.delayed(const Duration(seconds: 1));
    var galleryList = List<GalleryItem>.generate(
      40,
      (index) => GalleryItem(
        id: index,
        name: "Minha primeira imagem",
        description: "Some image",
        imagePath:
            "https://miro.medium.com/v2/resize:fit:1400/1*fwUnqg-eJnoL3gI-pw8yDw.png",
        isFavorite: false,
      ),
    );
    galleryItems = galleryList;

    setIsloading(false);
  }

  void setShowFavorite(bool value) {
    showFavorite = value;
    notifyListeners();
  }

  void setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void changeNavigationBarIndex(int value) {
    currentIndex = value;

    notifyListeners();
  }
}
