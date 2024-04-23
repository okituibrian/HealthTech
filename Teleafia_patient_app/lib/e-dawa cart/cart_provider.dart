import 'package:flutter/cupertino.dart';

import 'cart_model.dart';
import 'db_helper.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  double _totalPrice = 0.0;
  int _counter = 0; // Define the counter variable
  int get counter => _counter; // Getter for counter

  double get totalPrice => _totalPrice;
  late Future<List<Cart>> _cart;

  Future<List<Cart>> get cart => _cart;

  List<Cart> cartItems = []; // Initialize cartItems as an empty list

  Future<List<Cart>> getData() async {
    _cart = db.getCartlist();
    // Fetch the cart items and initialize the counter
    cartItems = await _cart;
    _counter = cartItems.length;
    return _cart;
  }


  double calculateTotalPrice(List<Cart> cartItems) {
    double total = 0.0;
    for (var cartItem in cartItems) {
      total += cartItem.quantity * (cartItem.productPrices ?? 0);
    }
    return total;
  }

  void addtotalPrice(double productPrice) {
    _totalPrice += productPrice;
    notifyListeners();
  }

  void removetotalPrice(num productPrice) {
    // Ensure that productPrice is an integer before subtracting it
    if (productPrice is int) {
      _totalPrice -= productPrice;
      if (_totalPrice < 0) {
        _totalPrice = 0; // Ensure the total price is never negative
      }
      notifyListeners();
    } else {
      print('Error: Product price is not an integer.');
    }
  }


  int getCounter(List<Cart> cartItems) {
    return cartItems.length;
  }

  void addCounter() {
    _counter++; // Increment the counter
    notifyListeners();
  }

  // Constructor
  CartProvider() {
    // Initialize counter from shared preferences or any other source if needed
  }

  void removeFromCart(Cart cartItem) async {
    if (cartItem.quantity > 0) {
      // Decrement the quantity in the cart item
      cartItem.quantity--;

      // If quantity becomes 0, delete the item from the database
      if (cartItem.quantity == 0) {
        await db.deleteCartItem(cartItem.productId);
      } else {
        // Update the quantity in the database
        await db.updateCartItemQuantity(cartItem.productId, cartItem.quantity);
      }

      // Update the total price
      removetotalPrice(cartItem.productPrices!);

      // If quantity becomes 0, decrement the counter
      if (cartItem.quantity == 0) {
        _counter--;
      }
    }

    // Notify listeners to rebuild the UI
    notifyListeners();
  }


  void addToCart(Cart cartItem) async {
    // Increment the quantity in the cart item
    cartItem.quantity++;

    // Update the quantity in the database
    await db.updateCartItemQuantity(cartItem.productId, cartItem.quantity);

    // Convert productPrices to double before passing it to addtotalPrice
    double productPrice = cartItem.productPrices!.toDouble();
    addtotalPrice(productPrice); // Update the total price

    // Notify listeners to rebuild the UI
    notifyListeners();
  }
}
