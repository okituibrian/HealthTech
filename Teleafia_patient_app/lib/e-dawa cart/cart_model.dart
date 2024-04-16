class Cart {
  final int id;
  final String productId;
  final String productNames;
  final String productDescriptions;
  final int productPrices;
  final String productImages;

  Cart({
    required this.id,
    required this.productId,
    required this.productNames,
    required this.productDescriptions,
    required this.productPrices,
    required this.productImages,
  });

  // Factory constructor to create Cart instance from a map
  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as int,
      productId: map['productId'] as String,
      productNames: map['productName'] as String,
      productDescriptions: map['productDescription'] as String,
      productPrices: map['productPrice'] as int,
      productImages: map['productImage'] as String,
    );
  }

  // Convert Cart instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productNames,
      'productDescription': productDescriptions,
      'productPrice': productPrices,
      'productImage': productImages,
    };
  }
}
