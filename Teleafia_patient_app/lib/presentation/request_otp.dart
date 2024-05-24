import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/verify_otp_page.dart';

import 'otp_service.dart';


class RequestOtp extends StatefulWidget {
  const RequestOtp({Key? key}) : super(key: key);

  @override
  State<RequestOtp> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<RequestOtp> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  final TextEditingController emailController = TextEditingController();

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
                    'Account Not verified? ',
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
                        'Please Enter Your Email Address To Receive A Verification Code',
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
                            color: maroon,
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
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await OtpService.requestOtp(emailController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please check your email for OTP reset code'),
                                backgroundColor: maroon,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Verify()),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $e'),
                              ),
                            );
                          }
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
