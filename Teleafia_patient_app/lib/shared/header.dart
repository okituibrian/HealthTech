import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teleafia_patient/presentation/api_call_functions.dart';
import '../presentation/notifications.dart';

class HealthClientHeader extends StatelessWidget {
  final String heading;

  HealthClientHeader({required this.heading});

  final Color background = const Color(0xFFFCF4F4);
  final Color dark_maroon = const Color(0xFF850808);

  @override
  Widget build(BuildContext context) {
    return HealthClientHeaderBar(context);
  }

  Widget HealthClientHeaderBar(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        AppBar(
          backgroundColor: background,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: dark_maroon,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Image.asset(
              'assets/logo.PNG',
              height: 80,
              width: 120,
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: dark_maroon,
              ),
              onPressed: () {
                ApiServices.fetchNotifications(context);
              },
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          heading,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: dark_maroon,
          ),
        ),
      ],
    );
  }
}

