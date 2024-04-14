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
    return _cart;
  }

  double calculateTotalPrice(List<Cart> cartItems) {
    double total = 0.0;
    for (var cartItem in cartItems) {
      total += cartItem.productPrice as double;
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
    // Remove the cartItem from the cartItems list
    cartItems.remove(cartItem);

    // Remove the item from the database
    await db.removeCartItem(cartItem.id.toString());

    // Update the total price by subtracting the price of the removed item
    if (cartItem.productPrice != null && cartItem.productPrice is int) {
      removetotalPrice(cartItem.productPrice!);
    }

    // Update the counter only if it's greater than 0
    if (_counter > 0) {
      _counter--;
    }

    // Notify listeners to rebuild the UI
    notifyListeners();
  }


}
