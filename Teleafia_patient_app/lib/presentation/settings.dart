import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/appointment_booking.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  Color darkMaron = Color(0XFF850808);
  bool pushNotification = false; // Initial toggle state
  bool darkMode = false; // Initial toggle state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HealthClientHeader(heading: 'Settings'),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Text(
                'Push notifications',
                style: TextStyle(
                  color: Color(0XFF850808), // Change color as needed
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                icon: pushNotification
                    ? Icon(
                        Icons.toggle_on_sharp,
                        color: maroon,
                      )
                    : Icon(
                        Icons.toggle_off_sharp,
                        color: Colors.grey,
                      ),
                iconSize: 40,
                color: maroon,
                onPressed: () {
                  // Add your desired functionality here
                  setState(() {
                    pushNotification = !pushNotification;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Text(
                'Dark Mode',
                style: TextStyle(
                  color: Color(0XFF850808), // Change color as needed
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                icon: darkMode
                    ? Icon(
                        Icons.toggle_on_sharp,
                        color: maroon,
                      )
                    : Icon(
                        Icons.toggle_off_sharp,
                        color: Colors.grey,
                      ),
                iconSize: 40,
                onPressed: () {
                  // Add your desired functionality here
                  setState(() {
                    darkMode = !darkMode;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  void bookAppointment() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => BookAppointment())));
  }
}
