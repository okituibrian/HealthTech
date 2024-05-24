import 'package:flutter/material.dart';
import '../presentation/notifications.dart';

class HealthClientHeader extends StatelessWidget {
  final String heading;

  HealthClientHeader({required this.heading});

  final Color background = const Color(0xFFFCF4F4);
  final Color maroon = const Color(0xFFc00100);
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
              ), // Replace icon1 with your desired icon
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Image.asset(
              'assets/logo.PNG', // Path to your image asset
              height: 80, // Adjust the height as needed
              width: 120, // Adjust the width as needed
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: dark_maroon,
              ), // Replace icon3 with your desired icon
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HealthClientNotifications()));
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