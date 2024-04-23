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

  List<String> productNames = [];
  List<String> productDescriptions = [];
  List<int> productPrices = [];
  List<String> productImages = [];

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
      final response = await http.get(Uri.parse('https://e886-102-210-244-74.ngrok-free.app/api/product/viewallproducts'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        setState(() {
          productNames = []; // Clear existing data
          productDescriptions = [];
          productPrices = [];
          productImages = [];

          // Iterate over the fetched products and add them to the lists
          for (var productData in responseData) {
            final Product product = Product.fromMap(productData);
            productNames.add(product.name);
            productDescriptions.add(product.description);
            productPrices.add(product.price);
            productImages.add(product.image);
          }
        });
      } else {
        throw Exception('Failed to fetch products data');
      }
    } catch (error) {
      print('Error fetching product data: $error');
      // Handle error accordingly
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
                        CartScreen(cartItems: cartItems, cartProvider: cart),
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
                                        addToCart(index as Product);
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

  void addToCart(Product product) {
    int uniqueId = DateTime
        .now()
        .millisecondsSinceEpoch;
    dbHelper.insert(
      Cart(
        id: uniqueId,
        productId: uuid.v4(),
        productNames: product.name,
        productDescriptions: product.description,
        productPrices: product.price,
        productImages: product.image,
      ),
    ).then((value) {
      print('Product is added to cart');
      cart.addtotalPrice(double.parse(product.price.toString()));
      cart.addCounter();
      cart.notifyListeners();
    }).catchError((error) {
      print('Error inserting product into cart: $error');
    });
  }
}
