import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:teleafia_chp_app/presentation/chp_dashboard.dart';

import 'loginpage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(

        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: background,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(50.0),
                    child: CircleAvatar(
                      backgroundColor: maroon,
                      radius: 50,
                      child: Icon(
                        Icons.lock,
                        size: 40,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Column(
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        children: [
                          Text(
                            'Please Change your password before proceeding',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              color: maroon,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            height: 40.0,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.email_rounded, color: maroon),
                                  hintText: 'Please Enter your Email',
                                  contentPadding: EdgeInsets.all(0.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: maroon, width: 1.0),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            height: 40.0,
                            child: TextField(
                              controller: newPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock, color: maroon),
                                  hintText: 'Enter New Password',
                                  contentPadding: EdgeInsets.all(0.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: maroon, width: 1.0),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            height: 40.0,
                            child: TextField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock, color: maroon),
                                  hintText: 'Confirm New Password',
                                  contentPadding: EdgeInsets.all(0.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: maroon, width: 1.0),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextButton(
                              onPressed: () {
                                String email = emailController.text;
                                String newPassword = newPasswordController.text;
                                String confirmPassword = confirmPasswordController
                                    .text;
            
                                if (newPassword == confirmPassword) {
                                  postDataToServer(email, newPassword);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Passwords do not match'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: maroon,
                              ),
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void postDataToServer(String email, String newPassword) async {
    // Backend active API endpoint
    String apiUrl = 'https://a939-102-210-244-74.ngrok-free.app/api/auth/chp/changepassword';

    // Data payload
    Map<String, String> data = {
      'email': email,
      'newPassword': newPassword,
    };

    if (email.isNotEmpty && newPassword.isNotEmpty) {
      // Make a POST request
      try {
        var response = await http.put(
          Uri.parse(apiUrl),
          body: data,
        );

        // Check if request was successful
        if (response.statusCode == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          // If the password change was successful, you can show a message or navigate to another page
          // For example:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Password changed successfully'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${response.reasonPhrase}'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $error'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email and password cannot be empty'),
          duration: Duration(seconds: 2),
        ),
      );
    }           
  }
}
