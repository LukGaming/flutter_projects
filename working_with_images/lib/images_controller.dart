import 'package:flutter/material.dart';
import 'package:working_with_images/images.dart';

class ImagesController extends ChangeNotifier {
  List<GalleryImages> images = [];

  void addImage(GalleryImages image) {
    images.add(image);
    notifyListeners();
  }
}
