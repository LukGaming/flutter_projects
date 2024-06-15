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
      'categoryId': categoryId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      price: map['price'] as double,
      categoryId: map['categoryId'] as int,
    );
  }
}
