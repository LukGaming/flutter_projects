class BaseModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  BaseModel({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
