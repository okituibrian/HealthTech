import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:badges/badges.dart' as badges;
import 'package:teleafia_partient/presentation/payment.dart';

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
  Color background = const Color(0xFFFCF4F4);
  final Color maroon = const Color(0xFF982B15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('My e-Dawa Cart', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: maroon,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                // Navigate to CartScreen
              },
              child: Center(
                child: badges.Badge(
                  badgeContent: Builder(
                    builder: (context) {
                      return Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          return Text(cartProvider.counter.toString(), style: TextStyle(color: Colors.white));
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
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        child: Column(
          children: [
            Expanded(
              child: _buildBody(context),
            ),
            Expanded(
              child: _buildBottomNavigationBar(),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(maroon),
                minimumSize: MaterialStateProperty.all<Size>(Size(80, 50)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Payment()));
              },
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (widget.cartItems.isEmpty) {
      return Center(child: Text('No items in the cart.'));
    } else {
      return ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cartItems[index];
          return ListTile(
            leading: Image.network(
              cartItem.productImage ?? '',
              width: 50,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            title: Text(
              cartItem.productName ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ': ${cartItem.productDescription ?? ''}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'Price: Ksh. ${cartItem.productPrice ?? '0'}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: maroon),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  widget.cartProvider.removeFromCart(cartItem);
                });
              },
            ),
          );
        },
      );
    }
  }

  Widget _buildBottomNavigationBar() {
    int totalItems = widget.cartItems.length;
    double totalPrice = widget.cartItems.fold(0, (previous, current) => previous + (current.productPrice ?? 0));

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: maroon),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Products: $totalItems',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: maroon),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total : Ksh. $totalPrice',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: maroon),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
