class Cart {
  final String productId;
  final String productImages;
  final String productNames;
  final String productDescriptions;
  final int productPrices;
  int quantity;
  bool selected; // Change type to bool

  Cart({
    required this.productId,
    required this.productImages,
    required this.productNames,
    required this.productDescriptions,
    required this.productPrices,
    this.quantity = 1,
    required this.selected, // Change type to bool
  });

  // Factory constructor to create Cart instance from a map
  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      productId: map['productId'] as String? ?? '',
      productImages: map['productImages'] as String? ?? '',
      productNames: map['productNames'] as String? ?? '',
      productDescriptions: map['productDescriptions'] as String? ?? '',
      productPrices: map['productPrices'] as int? ?? 0,
      quantity: map['quantity'] as int? ?? 0,
      selected: (map['selected'] as int? ?? 0) == 1, // Convert int to bool
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
      'quantity': quantity,
      'selected': selected ? 1 : 0, // Convert bool to int
    };
  }

}
