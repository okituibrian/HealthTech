import 'package:flutter/material.dart';

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
          leading: SizedBox(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp, color: dark_maroon),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Container(
            margin: const EdgeInsets.only(right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.PNG',
                  height: 60,
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
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
