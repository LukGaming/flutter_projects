class BaseModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  BaseModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
