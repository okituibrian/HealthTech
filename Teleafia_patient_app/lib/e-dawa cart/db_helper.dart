import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:teleafia_patient/e-dawa%20cart/products.dart';
import 'cart_model.dart';

class DBHelper {
  late Database _db;
  bool _isInitialized = false;

  Future<void> initDatabase() async {
    if (!_isInitialized) {
      // Initialize the database factory for sqflite_common_ffi
      databaseFactory = databaseFactoryFfi;
      // Open the database
      _db = await openDatabase('your_database.db', version: 1, onCreate: _onCreate);
      _isInitialized = true;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create the 'cart' table
    await db.execute(
      'CREATE TABLE cart ('
          'productId TEXT,'
          'productImages TEXT,'
          'productNames TEXT,'
          'productDescriptions TEXT,'
          'productPrices INTEGER,'
          'quantity INTEGER' // Add a comma if there are more columns
          ')',
    );
  }



  Future<void> insert(Cart cart) async {
    await initDatabase(); // Ensure _db is initialized
    await _db.insert('cart', cart.toMap());
  }

  Future<void> removeAllItemsFromCart() async {
    await initDatabase(); // Ensure _db is initialized
    await _db.delete('cart');
  }

  Future<List<Cart>> getCartlist() async {
    await initDatabase(); // Ensure _db is initialized
    final List<Map<String, dynamic>> queryResult = await _db.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<void> removeCartItem(String id) async {
    await initDatabase(); // Ensure _db is initialized
    await _db.delete('cart', where: 'productid = ?', whereArgs: [id]);
  }


  static Future<void> addToCart(Product product) async {
    int uniqueId = DateTime.now().millisecondsSinceEpoch;
    DBHelper dbHelper = DBHelper(); // Create an instance of DBHelper
    await dbHelper.initDatabase();
    await dbHelper.insert(
      Cart(

        productId:product.id,
        productImages: product.imageUrl,
        productNames: product.name,
        productDescriptions: product.description,
        productPrices: product.price,




      ),
    );
  }

  Future<void> addToCartFromProductList(List<Product> productList) async {
    try {
      for (var product in productList) {
        // Add each product to the cart
        await addToCart(product);
      }
    } catch (error) {
      print('Error adding products to cart: $error');
      throw Exception('Failed to add products to cart');
    }
  }

  Future<void> addCartItem(String id) async {
    await initDatabase(); // Ensure _db is initialized
    final existingCartItem = await _db.query('cart', where: 'productId = ?', whereArgs: [id]);

    if (existingCartItem.isNotEmpty) {
      // If the item already exists in the cart, update its quantity
      final currentQuantity = existingCartItem[0]['quantity'] as int? ?? 0; // Get the current quantity
      await _db.update('cart', {'quantity': currentQuantity + 1}, where: 'productId = ?', whereArgs: [id]);
    } else {
      // If the item does not exist in the cart, insert it with a quantity of 1
      await _db.insert('cart', {'productId': id, 'quantity': 1});
    }
  }

  Future<bool> checkProductExists(String productId) async {
    try {
      await initDatabase(); // Ensure _db is initialized
      final List<Map<String, dynamic>> existingProduct = await _db.query(
        'cart',
        where: 'productId = ?',
        whereArgs: [productId],
      );
      // If the existingProduct list is not empty, the product exists
      return existingProduct.isNotEmpty;
    } catch (error) {
      print('Error checking product existence: $error');
      return false; // Return false in case of any error
    }
  }

  // Update the quantity of a product in the database
  Future<void> updateCartItemQuantity(String productId, int quantity) async {
    // Update statement
    await _db.update(
      'cart',
      {'quantity': quantity},
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  Future<void> deleteCartItem(String productId) async {
    await _db.delete(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }
}