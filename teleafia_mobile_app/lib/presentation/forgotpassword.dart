import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/presentation/forgotpassword_verifcation.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Center(
        child: Container(
          color: background,
          width: MediaQuery.of(context).size.width *0.96,
          height: MediaQuery.of(context).size.height *0.96,
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
              height: 30.0,
              child: TextField(
                decoration: InputDecoration(suffixIcon: Icon(Icons.email_rounded),
                  hintText: 'Enter Email or Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: maroon,),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Verify()));
              },
                style: TextButton.styleFrom(backgroundColor: maroon,),
                child: Text('Send', style: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.white,
                ),

                ),),
            ),
            Column(
              children: [
                Text('Try another way',
                style: TextStyle(fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.red,
                ),
                ),
              ],
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
