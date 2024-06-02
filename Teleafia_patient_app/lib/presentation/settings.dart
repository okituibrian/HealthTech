import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/changepassword.dart';
import 'package:teleafia_patient/presentation/user_data_manager.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';
import 'appointment_booking.dart';
import 'dashboard.dart';

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
  bool darkMode = false;
  bool notification = false; // Initial toggle state
  TextEditingController _textEditingController = TextEditingController();
  String? filledText;

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
                'Account',
                style: TextStyle(
                  color: Color(0XFF850808), // Change color as needed
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.grey,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: background,
                      title: Text('Account Details'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30.0,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '${UserDataManager().name}',
                                    ),
                                    onSaved: (newValue) =>
                                    filledText = newValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: maroon),
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30.0,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '${UserDataManager().email}',
                                    ),
                                    onSaved: (newValue) =>
                                    filledText = newValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //margin: EdgeInsets.all(5),
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30.0,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '${UserDataManager().phoneNumber}',
                                    ),
                                    onSaved: (newValue) =>
                                    filledText = newValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Save the entered details and close the popup overlay
                            String enteredText = _textEditingController.text;
                            // Save to the database
                            print('Entered text: $enteredText');
                            AccountDetailsDialog.show(context);
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(color: maroon),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Text(
                'Change Password',
                style: TextStyle(
                  color: Color(0XFF850808), // Change color as needed
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePassword(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Text(
                'Notifications',
                style: TextStyle(
                  color: Color(0XFF850808), // Change color as needed
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                icon: notification
                    ? Icon(
                  Icons.toggle_on_sharp,
                  color: maroon,
                )
                    : Icon(
                  Icons.toggle_off_sharp,
                  color: Colors.grey,
                ),
                iconSize: 30,
                color: maroon,
                onPressed: () {
                  // Add your desired functionality here
                  setState(() {
                    notification = !notification;
                  });
                },
              ),
            ),
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
                iconSize: 30,
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
                iconSize: 30,
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

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

class AccountDetailsDialog extends StatefulWidget {
  @override
  _AccountDetailsDialogState createState() => _AccountDetailsDialogState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AccountDetailsDialog();
      },
    );
  }
}

class _AccountDetailsDialogState extends State<AccountDetailsDialog> {
  String filledText = ''; // This is where you can store the entered text
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
      Colors.white, // Change this to your desired background color
      title: Text('Account Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Full Name Input
          buildInputField('Full Name'),
          SizedBox(height: 10),
          // Email Address Input
          buildInputField('Email address'),
          SizedBox(height: 10),
          // Phone Number Input
          buildInputField('Phone Number'),
          SizedBox(height: 10),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Save the entered details and close the popup overlay
            String enteredText = _textEditingController.text;
            // Save to the database
            print('Entered text: $enteredText');

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MySettings()));
          },
          child: Text(
            'Save',
            style: TextStyle(color: maroon),
          ),
        ),
      ],
    );
  }

  Widget buildInputField(String hintText) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
            child: TextFormField(
              controller: TextEditingController(text: filledText),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
              onChanged: (newValue) => filledText = newValue,
            ),
          ),
        ],
      ),
    );
  }
}