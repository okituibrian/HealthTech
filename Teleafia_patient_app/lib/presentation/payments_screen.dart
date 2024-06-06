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
      home: MyPayments(),
    );
  }
}

class Payments {
  final int id;
  final double amountPaid;
  final String paymentMethod;
  final String transactionId;
  final String paymentStatus;
  final DateTime createdAt;

  Payments({
    required this.id,
    required this.amountPaid,
    required this.paymentMethod,
    required this.transactionId,
    required this.paymentStatus,
    required this.createdAt,
  });

  factory Payments.fromJson(Map<String, dynamic> json) {
    return Payments(
      id: json['id'],
      amountPaid: json['amountPaid'].toDouble(),
      paymentMethod: json['paymentMethod'],
      transactionId: json['transactionId'],
      paymentStatus: json['paymentStatus'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class MyPayments extends StatefulWidget {
  const MyPayments({Key? key}) : super(key: key);

  @override
  MyPaymentsState createState() => MyPaymentsState();
}

class MyPaymentsState extends State<MyPayments> with TickerProviderStateMixin {
  late TabController _tabController;
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color darkMaroon = const Color(0xFF850808);

  List<Payments> payments = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _fetchPayments();
  }

  Future<void> _fetchPayments() async {
    try {
      final response = await http.get(
          Uri.parse('${ApiServices.ngrokLink}/api/payments/get-one-patient-payments/${UserDataManager().idNumber}'));

      if (response.statusCode == 200) {
        final List<dynamic> paymentsData = json.decode(response.body);

        setState(() {
          payments = paymentsData.map((data) => Payments.fromJson(data)).toList();
        });
      } else {
        throw Exception('Failed to fetch payments');
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            HealthClientHeader(heading: 'Payments'),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(child: Text('Total', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Monthly', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Yearly', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Five years', style: TextStyle(fontSize: 12, color: maroon))),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent('Total'),
                  _buildTabContent('Monthly'),
                  _buildTabContent('Yearly'),
                  _buildTabContent('Five years'),
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
    List<Payments> filteredPayments;
    switch (status) {
      case 'Total':
        filteredPayments = payments; // Adjust filtering as needed
        break;
      case 'Monthly':
        filteredPayments = payments.where((payment) => payment.createdAt.isAfter(DateTime.now().subtract(Duration(days: 30)))).toList();
        break;
      case 'Yearly':
        filteredPayments = payments.where((payment) => payment.createdAt.isAfter(DateTime.now().subtract(Duration(days: 365)))).toList();
        break;
      case 'Five years':
        filteredPayments = payments.where((payment) => payment.createdAt.isAfter(DateTime.now().subtract(Duration(days: 365 * 5)))).toList();
        break;
      default:
        filteredPayments = [];
    }

    if (filteredPayments.isEmpty) {
      return Center(child: Text('No expenditure yet'));
    }

    return ListView.builder(
      itemCount: filteredPayments.length,
      itemBuilder: (context, index) {
        return _buildPaymentWidget(filteredPayments[index]);
      },
    );
  }

  Widget _buildPaymentWidget(Payments payment) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Receipt',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: darkMaroon),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 5.0, // gap between lines
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today, size: 15),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text('Amount Paid: \$${payment.amountPaid}', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_balance_wallet, size: 15),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text('Transaction ID: ${payment.transactionId}', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, size: 15),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text('Payment Status: ${payment.paymentStatus}', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.payment, size: 15),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text('Payment Method: ${payment.paymentMethod}', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.date_range, size: 15),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text('Date: ${DateFormat('yyyy-MM-dd').format(payment.createdAt)}', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              GestureDetector(
                onTap: () => _selectDate(),
                child: Row(
                  children: [
                    Text('Details ', style: TextStyle(fontSize: 16)),
                    Icon(Icons.info_outline, size: 13, color: maroon),
                  ],
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _selectDate() {
    // Implement the select date functionality
  }
}

class _selectDate {}
