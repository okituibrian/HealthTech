/*
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teleafia_patient/e-dawa cart/cart_model.dart';

// Define the function to fetch products from the backend server
Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://647c-102-210-244-74.ngrok-free.app/products/viewallproducts'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
*/
