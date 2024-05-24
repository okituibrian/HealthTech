import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                _fetchNotifications(context); // Pass the context
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

Future<void> _fetchNotifications(BuildContext context) async {
  try {
    final response = await http.get(
        Uri.parse('https://41cf-102-210-244-74.ngrok-free.app/api/notifications/getallnotifications/123456'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['notifications'] != null &&
          responseData['notifications'].isNotEmpty) {
        // Assuming the message is in the first item of the notifications list
        var message = responseData['notifications'][0]['message'];
        print(message);
        // Pass the notifications data to the destination widget
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HealthClientNotifications(message: message)),
        );
      } else {
        throw Exception('No notifications found');
      }
    } else {
      throw Exception('Failed to fetch notifications');
    }
  } catch (e) {
    print('Error: $e');
  }
}

