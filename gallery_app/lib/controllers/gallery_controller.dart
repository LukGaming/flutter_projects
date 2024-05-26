import 'package:flutter/material.dart';
import 'package:gallery_app/models/gallery_item.dart';

class GalleryController extends ChangeNotifier {
  List<GalleryItem> galleryItems = [];
  bool isLoading = true;

  void loadGalleryItems() async {
    setIsloading(true);
    await Future.delayed(Duration(seconds: 1));
    galleryItems = [
      GalleryItem(
        id: 1,
        name: "Minha primeira imagem",
        description: "Some image",
        imagePath:
            "https://miro.medium.com/v2/resize:fit:1400/1*fwUnqg-eJnoL3gI-pw8yDw.png",
        isFavorite: false,
      ),
      GalleryItem(
        id: 1,
        name: "Minha primeira imagem",
        description: "Some image",
        imagePath:
            "https://miro.medium.com/v2/resize:fit:1400/1*fwUnqg-eJnoL3gI-pw8yDw.png;.;;;",
        isFavorite: false,
      )
    ];

    setIsloading(false);
  }

  void setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
