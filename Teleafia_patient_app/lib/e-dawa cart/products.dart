class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      description: map['description'],
      price: map['price'] ?? 0,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': imageUrl,
    };
  }
}
