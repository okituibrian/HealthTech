import'package:flutter/material.dart';

class ChpDashboard extends StatefulWidget {
  const ChpDashboard({super.key});

  @override
  State<ChpDashboard> createState() => _ChpDashboardState();
}

class _ChpDashboardState extends State<ChpDashboard> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
    );
  }
}
