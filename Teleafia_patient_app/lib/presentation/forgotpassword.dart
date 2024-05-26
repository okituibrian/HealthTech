import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/resetpassword.dart';

import 'api_call_functions.dart';





class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  final TextEditingController emailController = TextEditingController();

  void postToDatabase() async {
    if (!mounted) return; // Check if the widget is still mounted

    String email = emailController.text;
    if (email.isNotEmpty) {
      String apiUrl = '${ApiServices.ngrokLink}/api/forgotpassword';
      Map<String, String> data = {
        'email': email,
      };

      try {
        var response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        );

        if (response.statusCode == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Email not found, please enter the correct email address'),
            ),
          );
        }
      } catch (e) {
        if (!mounted) return; // Check again after the asynchronous operation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter email'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Center(
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
              SizedBox(height: 2.0,),
              Column(
                children: [
                  Text(
                    'Not verified? Request OTP to verify your acoount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    children: [
                      Text(
                        'Please Enter Your Email AddressTo Receive A Verification Code',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: maroon
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 40.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_rounded, color: maroon),
                              hintText: 'Enter Email',
                              contentPadding: EdgeInsets.all(0.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon, width: 1.0),
                              )
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      ElevatedButton(
                        onPressed: () {
                          postToDatabase();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('please check your email for OTP reset code'),
                              backgroundColor: Color(0xFF982B15), // Maroon background color
                            ),
                          );
                        },
                        style: TextButton.styleFrom(backgroundColor: maroon),
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
    );
  }
}
