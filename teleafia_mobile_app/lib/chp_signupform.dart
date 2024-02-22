import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/verifypage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PatientSignupPage(),
  ),);
}
class PatientSignupPage extends StatefulWidget {
  const PatientSignupPage({super.key});

  @override
  State<PatientSignupPage> createState() => _PatientSignupPageState();
}

class _PatientSignupPageState extends State<PatientSignupPage> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: SafeArea(
        child: Container(
          color: background,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text('Proceed with your',
                    style: TextStyle(
                        color: maroon,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend-Medium.ttf,'

                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  flex: 1,
                  child: Text('REGISTRATION',
                    style: TextStyle(
                      color: maroon,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend-Medium.ttf',
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox( height: 40.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.contact_emergency, color: maroon,),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        prefixIcon: Icon(Icons.email_rounded, color: maroon,),

                        enabledBorder: OutlineInputBorder(
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
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone, color: maroon,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: maroon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ID/Passport number',
                        prefixIcon: Icon(Icons.perm_identity, color: maroon,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Location',
                        prefixIcon: Icon(Icons.location_on, color: maroon,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      obscureText: _obsecureText,
                      decoration: InputDecoration(
                        hintText: 'Create Password',
                        prefixIcon: Icon(Icons.lock, color: maroon,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      obscureText: _obsecureText,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.check, color: maroon,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Verify()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: maroon,
                    ),
                    child: Text('REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
