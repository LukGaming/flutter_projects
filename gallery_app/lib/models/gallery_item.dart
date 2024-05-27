class GalleryItem {
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
  });
}
