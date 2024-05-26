import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:teleafia_patient/presentation/payment.dart';
import '../Bloc/registerbloc/auth_cubit.dart';
import '../Bloc/registerbloc/auth_state.dart';
import '../e-dawa cart/cart_model.dart';
import '../e-dawa cart/cart_provider.dart';
import '../shared/bottom_nav.dart';

class CartScreen extends StatefulWidget {
  final CartProvider cartProvider;
  final List<Cart> cartItems;

  CartScreen({
    required this.cartProvider,
    required this.cartItems, required idNumber,
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My e-dawa Cart', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF982B15), // Maroon color
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                // Navigate to CartScreen
              },
              child: Center(
                child: Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    return badges.Badge(
                      badgeContent: Text(
                        cartProvider.counter.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(Icons.shopping_cart, color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          List<Cart> cartItems = cartProvider.cartItems;
          return Column(
            children: [
              Expanded(
                child: cartItems.isEmpty
                    ? Center(child: Text('No items in the cart.'))
                    : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return ListTile(
                      leading: Checkbox(
                        value: cartItem.selected,
                        onChanged: (value) {
                          setState(() {
                            cartItem.selected = value!;
                            // Update total price based on selection
                            if (value) {
                              cartProvider.addToTotal(cartItem.productPrices ?? 0);
                            } else {
                              cartProvider.removeFromTotal(cartItem.productPrices.toDouble());
                            }
                          });
                        },
                        activeColor: Colors.red, // Update active color
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  cartItem.productImages ?? '',
                                  width: 100,
                                  height: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.productNames ?? '',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        cartItem.productDescriptions ?? '',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Price: Ksh. ${cartItem.productPrices ?? '0'}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (cartItem.quantity > 0) {
                                    cartProvider.removeFromCart(cartItem);
                                  }
                                },
                              ),
                              Text('${cartItem.quantity}'),
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                onPressed: () {
                                  cartProvider.addToCart(cartItem);
                                },
                              ),
                              SizedBox(width: 10), // Add some spacing
                              Text(
                                'Total: Ksh. ${cartItem.productPrices * cartItem.quantity}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              _buildBottomNavigationBar(context, cartProvider),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  minimumSize: MaterialStateProperty.all<Size>(Size(80, 50)),
                ),
               /* onPressed: () {
                  // Hardcoded idNumber
                  String idNumber = '123456';

                  List<Map<String, dynamic>> products = widget.cartItems.map((cartItem) {
                    return {
                      'productId': cartItem.productId,
                      'quantity': cartItem.quantity.toString(),
                    };
                  }).toList();

                  checkout(context, idNumber, products);
                },*/
                onPressed: () {
                  final authCubit = context.read<AuthCubit>();
                  final authState = authCubit.state;

                  if (authState is AuthAuthenticated) {
                    String idNumber = authState.idNumber;

                    List<Map<String, dynamic>> products = widget.cartItems.map((cartItem) {
                      return {
                        'productId': cartItem.productId,
                        'quantity': cartItem.quantity.toString(),
                      };
                    }).toList();

                    checkout(context, idNumber, products);
                  } else {
                    print("User not authenticated");
                  }
                },

                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          );
        },
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, CartProvider cartProvider) {
    // Filter cart items based on selected status
    List<Cart> selectedCartItems = cartProvider.cartItems.where((item) => item.selected).toList();

    // Calculate total items and total price for selected items
    int totalItems = selectedCartItems.length;
    double totalPrice = selectedCartItems.fold(0, (previous, current) => previous + (current.productPrices * current.quantity));

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.red, // Update border color
            width: 4.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'ORDER DETAILS',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Products: $totalItems',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total : Ksh. $totalPrice',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

void checkout(BuildContext context, String idNumber, List<Map<String, dynamic>> products) async {

  // Data payload
  Map<String, dynamic> data = {
    'idNumber': idNumber,
    'products': products,
  };

  String jsonData = jsonEncode(data);

  String apiUrl = 'https://710a-102-219-210-70.ngrok-free.app/api/billings/addbillings';
  print('Sending data to Wilson API:');
  print(data);
  print(idNumber);

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 201 && response.body != null) {
      var responseData = jsonDecode(response.body);
      var billingId = responseData['billingId'];
      if (billingId != null) {
        // Navigate to the next screen (e.g., Login screen)
        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(billingId: billingId, appointmentId: '')));

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Checkout successful, wait for MPESA to reply'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Show an error message if the billingId is null
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Billing ID is null'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      // Show an error message if the request was not successful
      print('Error: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${response.reasonPhrase}'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (error) {
    // Show an error message if an exception occurred
    print('Error: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $error'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
