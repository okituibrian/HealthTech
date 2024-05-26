import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class HealthClientNotifications extends StatelessWidget {
  final String message;

  HealthClientNotifications({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Notifications(message: message,);
  }
}

class Notifications extends StatefulWidget {
  final String message;
  int _notificationCount = 0;

  Notifications({required this.message});

  @override
  _NotificationsState createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {

  final TextEditingController _textController = TextEditingController();
  final Color background = Color(0XFFFCF4F4);
  final Color dark_maroon = Color(0XFF850808);
  final Color maroon = Color(0XFFC00100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: <Widget>[
          HealthClientHeader(heading: 'Notifications'),

          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(20.0),

            child: Column(
              children: [
                SizedBox(width: 5),
                Text('${widget.message}', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          SizedBox(
            height: 5,
          )
        ],
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }
}