import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class HealthClientNotifications extends StatelessWidget {
  final List<String> messages; // Change type to List<String>

  HealthClientNotifications({
    required this.messages, // Update constructor parameter
  });

  @override
  Widget build(BuildContext context) {
    return Notifications(messages: messages);
  }
}

class Notifications extends StatefulWidget {
  final List<String> messages; // Change type to List<String>

  Notifications({required this.messages}); // Update constructor parameter

  @override
  _NotificationsState createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {
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
          Expanded(
            child: ListView.builder(
              itemCount: widget.messages.length, // Use messages from widget
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(widget.messages[index], style: TextStyle(fontSize: 16)), // Use messages from widget
                );
              },
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
