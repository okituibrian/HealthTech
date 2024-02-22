import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/chp_signupform.dart';
import 'package:teleafia_mobile_app/chp_signupform.dart';
import 'package:teleafia_mobile_app/forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: SafeArea(
        child: Container(
          color: background,
          width: MediaQuery.of(context).size.width *1,
          height: MediaQuery.of(context).size.height *1,

          child: Padding(
            padding: EdgeInsets.all(5.0),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            ClipRRect( borderRadius: BorderRadius.circular(40.0),
            child: Image.asset('assets/logo.png',
              width: 200,
              height:80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox (height: 10.0),

          ClipRRect(borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/Hosp.jpg',
              width: 500,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox (height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(2.0,1.0, 170.0, 1.0),
            child: Text('Proceed With your',
              style: TextStyle(
                color: maroon,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ) ,

          SizedBox (height: 5.0),

          Padding(
            padding: EdgeInsets.fromLTRB(2.0, 1.0, 250.0,1.0),
            child: Text('LOGIN',
              style: TextStyle(
                color: maroon,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
          ),

          SizedBox (height: 10.0),

          Container(
            height: 35.0,
            child: TextField(
              decoration: InputDecoration( prefixIcon:Icon(Icons.contact_emergency,
                  color: maroon),
                hintText: 'Email/Mobile',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),

            ),
          ),

          SizedBox(height:10.0) ,

          Container(
            height: 35.0,
            child: TextField(
              decoration: InputDecoration(prefixIcon:Icon(Icons.lock,
                  color: maroon),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),

                ),
              ),

            ),
          ),

          SizedBox(height: 10.0,)  ,

          ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: maroon,
            ),
            child: Text('LOGIN',
              style: TextStyle(
                color:Colors.white,
                fontSize: 15.0,
              ),
            ),

          ),

          SizedBox(height: 10.0) ,

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text('Forgot Password?',
              style: TextStyle(
                color:maroon,
                fontSize: 14.0,
              ),
            ),
          ),
            SizedBox(height: 10.0),

            Row(
              children: [
                Text('To create account'),


                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PatientSignupPage()));
                },
                  child: Text('SIGNUP',
                    style: TextStyle(
                      color: maroon,
                    ),
                  ),
                ) ,
              ],
            ),
            ],
          ),
        ),

      ),
    ),
    );
  }
}
