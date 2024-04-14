import 'package:flutter/material.dart';

Widget buildBottomNavBar(BuildContext context, int index, Widget Screen, VoidCallback onPressed) {
  final Color maroon = const Color(0xFFc00100);
  final Color background = const Color(0xFFFCF4F4);

  return Container(
    color: background,
    child: BottomAppBar(
      height: 60,
      color: background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  'Next',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(300, 50),
              backgroundColor: maroon,
            ),
          ),
        ],
      ),
    ),
  );
}

class BottomNavBar extends StatelessWidget {
  final Widget screen; // Changed 'Screen' to 'screen'
  final VoidCallback onPressed;

  BottomNavBar({required this.screen, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return buildBottomNavBar(context, 0, screen, onPressed);
  }
}
