import 'package:gallery_app/models/base_model.dart';

class GalleryItem extends BaseModel {
  String name;
  String description;
  String imagePath;
  bool isFavorite;
  GalleryItem({
    required int id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.isFavorite,
  }) : super(id: id);
}
