class Cart {
  late final int? id;
  final String? productId;
  final String? productName;
  final String? productDescription;
  final int? productPrice;
  final String? productImage; // Ensure productImage is of type String

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res["productId"],
        productName = res["productName"],
        productDescription = res["productDescription"],
        productPrice = res['productPrice'],
        productImage = res["productImage"]?.toString(); // Ensure productImage is cast to String

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'productImage': productImage,
    };
  }
}
