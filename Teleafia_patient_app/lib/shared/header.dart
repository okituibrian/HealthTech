
import 'package:flutter/material.dart';
import '../presentation/api_call_functions.dart';
import 'package:badges/badges.dart' as custom_badge;



class HealthClientHeader extends StatefulWidget {
  final String heading;

  HealthClientHeader({required this.heading});

  @override
  _HealthClientHeaderState createState() => _HealthClientHeaderState();
}

class _HealthClientHeaderState extends State<HealthClientHeader> {
  int _notificationCount = 0;

  final Color background = const Color(0xFFFCF4F4);
  final Color darkMaroon = const Color(0xFF850808);

  @override
  void initState() {
    super.initState();
   // ApiServices.fetchNotifications(context, _updateNotificationCount);
  }

  void _updateNotificationCount(int count) {
    setState(() {
      _notificationCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          child: AppBar(
            backgroundColor: background,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: darkMaroon,
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
              Padding(
                padding: const EdgeInsets.only(right: 16.0), // Add padding to the right
                child: custom_badge.Badge(
                  badgeContent: Text(
                    '$_notificationCount',
                    style: TextStyle(color: Colors.white),
                  ),
                  showBadge: _notificationCount > 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_active,
                      color: darkMaroon,
                    ),
                    onPressed: () {
                      ApiServices.fetchNotifications(context, _updateNotificationCount);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.heading,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: darkMaroon,
          ),
        ),
      ],
    );
  }
}
