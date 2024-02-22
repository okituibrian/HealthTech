import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();}
class _ResetPasswordState extends State<ResetPassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Text('Reset Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30.0,),
        Column(
          children: [
            Text('Please Enter The Verification Code'
                ' Sent to Your Email or Phone',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 30.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Reset Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 30.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 30.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextButton(onPressed: (){},
                style: TextButton.styleFrom(backgroundColor: maroon,),
                child: Text('Reset', style: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.white,
                ),

                ),),
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
