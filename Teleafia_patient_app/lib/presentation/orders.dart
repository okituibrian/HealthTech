import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:teleafia_patient/presentation/feedback_ratings.dart';
import 'package:teleafia_patient/presentation/messages.dart';
import 'package:teleafia_patient/presentation/notifications.dart';
import 'package:teleafia_patient/presentation/user_data_manager.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';

import 'api_call_functions.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyOrders(),
    );
  }
}

class Product {
  final String productId;
  final int quantity;

  Product({required this.productId, required this.quantity});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      quantity: int.parse(json['quantity']),
    );
  }
}


class Orders {
  final List<Product> products;
  final String customerName;
  final String customerEmail;
  final String customerPhoneNumber;
  final double amountBilled;
  final String paymentStatus;
  final DateTime createdAt;

  Orders({
    required this.products,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhoneNumber,
    required this.amountBilled,
    required this.paymentStatus,
    required this.createdAt,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> products = productList.map((i) => Product.fromJson(i)).toList();

    return Orders(
      products: products,
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
      customerPhoneNumber: json['customerPhoneNumber'],
      amountBilled: json['amountBilled'].toDouble(),
      paymentStatus: json['paymentStatus'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}


class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  MyOrdersState createState() => MyOrdersState();
}

class MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  late TabController _tabController;
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color darkMaroon = const Color(0xFF850808);

  List<Orders> orders = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    try {
      final response = await http.get(
          Uri.parse('${ApiServices
              .ngrokLink}/api/billings/getpatientbillings/${UserDataManager()
              .idNumber}'));

      if (response.statusCode == 200) {
        //print(response.body);
        final List<dynamic> orderJson = json.decode(response.body);

        setState(() {
          orders = orderJson.map((data) => Orders.fromJson(data)).toList();
        });
      } else {
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: [
            HealthClientHeader(heading: 'Orders'),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(child: Text('In Progress',
                    style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Delivered',
                    style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text(
                    'Pending', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Total Orders',
                    style: TextStyle(fontSize: 12, color: maroon))),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent('In Progress'),
                  _buildTabContent('Delivered'),
                  _buildTabContent('Pending'),
                  _buildTabContent('Total Orders'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  Widget _buildTabContent(String status) {
    List<Orders> filteredOrders;
    switch (status) {
      case 'Total Orders':
        filteredOrders = orders;
        break;
      case 'In Progress':
        filteredOrders = orders;
      // filteredOrders = orders.where((order) => order.paymentStatus == 'In Progress').toList();
        break;
      case 'Delivered':
        filteredOrders = orders.where((order) => order.paymentStatus == 'Delivered').toList();
        break;
      case 'Pending':
        filteredOrders = orders;
        //filteredOrders = orders.where((order) => order.paymentStatus == 'Pending').toList();
        break;
      default:
        filteredOrders = [];
    }

    print('Filtered Orders for $status: ${filteredOrders.length}'); // Debugging log

    if (filteredOrders.isEmpty) {
      return Center(child: Text('No tracking orders yet'));
    }

    return ListView.builder(
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        return _buildOrdersWidget(filteredOrders[index]);
      },
    );
  }


  Widget _buildOrdersWidget(Orders order) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Customer Name: ${order.customerName}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Customer Email: ${order.customerEmail}'),
              Text('Phone Number: ${order.customerPhoneNumber}'),
              Text('Amount Billed: ${order.amountBilled}'),
              Text('Payment Status: ${order.paymentStatus}'),
              Text('Date: ${DateFormat('yyyy-MM-dd').format(order.createdAt)}'),
              SizedBox(height: 10),
              Text('Products:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...order.products.map((product) => Text('Product ID: ${product.productId}, Quantity: ${product.quantity}')).toList(),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}