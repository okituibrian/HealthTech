class Cart {

  final String productId;
  final String productImages;
  final String productNames;
  final String productDescriptions;
  final int productPrices;
  int quantity;


  Cart({

    required this.productId,
    required this.productImages,
    required this.productNames,
    required this.productDescriptions,
    required this.productPrices,
    this.quantity = 1,

  });

  // Factory constructor to create Cart instance from a map
  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(

      productId: map['productId'] as String? ?? '', // Handle nullable productId
      productImages: map['productImages'] as String? ?? '', // Handle nullable productImages
      productNames: map['productNames'] as String? ?? '', // Handle nullable productNames
      productDescriptions: map['productDescriptions'] as String? ?? '', // Handle nullable productDescriptions
      productPrices: map['productPrices'] as int? ?? 0, // Handle nullable productPrices
      quantity: map['quantity'] as int? ?? 0,
    );
  }


  // Convert Cart instance to a map
  Map<String, dynamic> toMap() {
    return {

      'productId': productId,
      'productImages': productImages,
      'productNames': productNames,
      'productDescriptions': productDescriptions,
      'productPrices': productPrices,
      'quantity':quantity,

    };
  }
}
