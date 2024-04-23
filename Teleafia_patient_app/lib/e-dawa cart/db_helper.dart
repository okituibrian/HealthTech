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
          'id VARCHAR UNIQUE, '
          'productId VARCHAR, '
          'productName TEXT, '
          'productDescription TEXT, '
          'productPrice INTEGER, '
          'productImage TEXT'
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
    await _db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Product>> getProductsFromApi() async {
    try {
      final apiUrl = 'YOUR_API_URL_HERE'; // Replace with your API endpoint
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((productData) => Product.fromMap(productData)).toList();
      } else {
        throw Exception('Failed to fetch products data from API');
      }
    } catch (error) {
      print('Error fetching products data from API: $error');
      throw Exception('Failed to fetch products data from API');
    }
  }

  static Future<void> addToCart(Product product) async {
    int uniqueId = DateTime.now().millisecondsSinceEpoch;
    DBHelper dbHelper = DBHelper(); // Create an instance of DBHelper
    await dbHelper.initDatabase();
    await dbHelper.insert(
      Cart(
        id: uniqueId,
        productId: product.id,
        productNames: product.name,
        productDescriptions: product.description,
        productPrices: product.price,
        productImages: product.image,
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
}
