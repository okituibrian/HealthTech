import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uuid/uuid.dart';

import '../e-dawa cart/cart_model.dart';
import '../e-dawa cart/cart_provider.dart';
import '../e-dawa cart/db_helper.dart';
import '../e-dawa cart/products.dart';
import '../shared/bottom_nav.dart';
import 'cart_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Color maroon = const Color(0xFF982B15);
  late CartProvider cart;
  late DBHelper dbHelper;
  final uuid = Uuid();

  List<String> productId = [];
  List<String> productImages = [];
  List<String> productNames = [];
  List<String> productDescriptions = [];
  List<int> productPrices = [];


  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    initDbAndLoadProducts();
  }

  Future<void> initDbAndLoadProducts() async {
    await dbHelper.initDatabase();
    await fetchProductDataFromBackend(); // Call the method to fetch products from the backend
    // getProductDataFromDatabase(); // Load products from local database
  }


  Future<void> fetchProductDataFromBackend() async {
    try {
      final response = await http.get(Uri.parse(
          'https://ba43-105-161-31-235.ngrok-free.app/api/product/viewallproducts'));
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);

        if (responseData != null) {
          setState(() {
            productId.clear();
            productImages.clear();
            productNames.clear();
            productDescriptions.clear();
            productPrices.clear();

            for (var productData in responseData) {
              if (productData != null && productData is Map<String, dynamic>) {
                final Product product = Product.fromMap(productData);
                productId.add(product.id ?? '');
                productImages.add(product.imageUrl ?? '');
                productNames.add(product.name ?? '');
                productDescriptions.add(product.description ?? '');
                productPrices.add(int.parse(product.price.toString() ?? '0'));
              }
            }
          });
        }
      } else {
        throw Exception('Failed to fetch product data');
      }
    } catch (error) {
      print('Error fetching product data: $error');
    }
  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cart = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maroon,
        title: Text(
          'Our Products',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                List<Cart> cartItems = await cart.getData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartScreen(cartItems: cartItems, cartProvider: cart, idNumber: '',),
                  ),
                );
              },
              child: Center(
                child: badges.Badge(
                  badgeContent: Builder(
                    builder: (context) {
                      return Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return Text(value.counter.toString(),
                              style: TextStyle(color: Colors.white));
                        },
                      );
                    },
                  ),
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productNames.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(productImages[index]),
                            ),
                            SizedBox(width: 20.0,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productNames[index], style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text(productDescriptions[index],
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),),
                                  SizedBox(height: 5,),
                                  Text('Ksh.' + productPrices[index].toString(),
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: maroon),),
                                  SizedBox(width: 0,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        addToCart(index as int);
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: maroon,
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        child: Center(
                                          child: Text('Add to Cart',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  void addToCart(int index) async {
    // Check if the product already exists in the cart
    bool productExists = await dbHelper.checkProductExists(productId[index]);

    if (productExists) {
      // If the product already exists, show a popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Product Already in Cart',
              style: TextStyle(color: maroon),),
            content: Text('This product is already in your cart.',
            style: TextStyle(color: Colors.black),),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // If the product does not exist, add it to the cart
      dbHelper.insert(
        Cart(
          productId: productId[index],
          productImages: productImages[index],
          productNames: productNames[index],
          productDescriptions: productDescriptions[index],
          productPrices: productPrices[index], selected: true,
        ),
      ).then((value) {
        // After adding the product to the cart, update counters and notify listeners
        print('Product is added to cart');
        cart.addtotalPrice(double.parse(productPrices[index].toString()));
        cart.addCounter();
        cart.notifyListeners();
      }).catchError((error) {
        print('Error inserting product into cart: $error');
      });
    }
  }

}