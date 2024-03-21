import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/presentation/resetpassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Define the controller
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);

  final TextEditingController emailController = TextEditingController();

  void postToDatabase() async {
    String email = emailController.text;
    if (email.isNotEmpty) {
      String apiUrl = 'https://5696-102-210-244-74.ngrok-free.app/api/chp/forgotpassword';
      Map<String, String> data = {
        'email': email,};
      try {
        var response = await http.put(Uri.parse(apiUrl),
          body: data,
        );
        if (response.statusCode == 200) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword()));
        } else {
          Text('email not found, please enter a valid email address');
        }
      }
      catch (e) {
        Text('Error: $e');
      }
    }

    else {
      Text('please enter email');
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
          width: MediaQuery
              .of(context)
              .size
              .width * 0.96,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.96,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(50.0),
                child: CircleAvatar(
                  backgroundColor: maroon,
                  radius: 50,
                  child: Icon(Icons.lock,
                    size: 40,
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(height: 2.0,),
              Column(
                children: [
                  Text('Forgot Password ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    children: [
                      Text('Please Enter Your Email Address'
                          'To Receive A Verification Code',
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
                          // Assign the controller here
                          decoration: InputDecoration(prefixIcon: Icon(
                              Icons.email_rounded, color: maroon),
                              hintText: 'Enter Email',
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
                      SizedBox(height: 20.0,),
                      ElevatedButton(
                        onPressed: () {
                          //  String email = emailController.text,
                          postToDatabase();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Sending email to database...'),
                            ),
                          );
                        },

                        style: TextButton.styleFrom(backgroundColor: maroon,),
                        child: Text('Send', style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white,
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
