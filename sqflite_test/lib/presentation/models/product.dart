// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int? id;
  String name;
  double price;
  int categoryId;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'category_id': categoryId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: double.parse(map['price'].toString()),
      categoryId: map['category_id'],
    );
  }

  Product copyWith({
    int? id,
    String? name,
    double? price,
    int? categoryId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, categoryId: $categoryId)';
  }
}
