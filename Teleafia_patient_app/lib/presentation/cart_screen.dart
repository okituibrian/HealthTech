import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:teleafia_patient/presentation/dashboard.dart';
import 'package:teleafia_patient/presentation/payment.dart';
import '../e-dawa cart/cart_model.dart';
import '../e-dawa cart/cart_provider.dart';
import '../shared/bottom_nav.dart';
import 'delivery_form.dart';

class CartScreen extends StatefulWidget {
  final CartProvider cartProvider;
  final List<Cart> cartItems;

  CartScreen({required this.cartProvider, required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my edawa cart', style: TextStyle(color: Colors.white)),
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
                      leading: Image.network(
                        cartItem.productImages ?? '',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      ),
                      title: Text(
                        cartItem.productNames ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ': ${cartItem.productDescriptions ?? ''}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            'Price: Ksh. ${cartItem.productPrices ?? '0'}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      trailing: Row(
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
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red), // Change color
                  minimumSize: MaterialStateProperty.all<Size>(Size(80, 50)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Payment()),
                  );
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
    int totalItems = cartProvider.cartItems.length;
    double totalPrice = cartProvider.totalPrice;

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: maroon, // Specify the color of the border
            width: 4.0, // Specify the width of the border
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
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Change color
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Products: $totalItems',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Change color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total : Ksh. $totalPrice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Change color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),

          ],
        ),
      ),
    );
  }
}
