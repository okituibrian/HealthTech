import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teleafia_mobile_app/presentation/landingpage.dart';



class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  final TextEditingController initialPasswordController = TextEditingController();
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
          child: Container(
            color: background,
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.96,
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
                            controller: initialPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Please Enter the original Password',
                              fillColor: maroon,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          child: TextField(
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Enter New Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          child: TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Confirm New Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextButton(
                            onPressed: () {
                              String originalPassword = initialPasswordController.text;
                              String newPassword = newPasswordController.text;
                              String confirmPassword = confirmPasswordController.text;

                              if (newPassword == confirmPassword) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Welcome()));
                                // Call the function to send data to the server
                                postDataToServer(originalPassword, newPassword);
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
                              'Reset',
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
    );
  }

  void postDataToServer(String originalPassword, String newPassword) async {
    // Define your API endpoint
    String apiUrl = 'http://localhost:4000/register';

    // Example data payload
    Map<String, String> data = {
      'originalPassword': originalPassword,
      'newPassword': newPassword,
    };

    // Make a POST request
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Handle success
        print('Password reset successful');
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle any errors that occur during the process
      print('Error: $error');
    }
  }
}

