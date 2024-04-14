import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';


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
    await db.execute(
        'CREATE TABLE cart (id VARCHAR UNIQUE, productId VARCHAR, productName TEXT, productDescription TEXT, productPrice INTEGER, productImage TEXT)');
  }

  Future<void> insert(Cart cart) async {
    await initDatabase(); // Ensure _db is initialized
    await _db.insert('cart', cart.toMap());
  }

  Future<void> removeAllItemsFromCart() async {
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
}
