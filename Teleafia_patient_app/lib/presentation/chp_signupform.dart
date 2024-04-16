
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:trial_app/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teleafia_patient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_patient/presentation/verify_otp_page.dart';
//import 'package:trial_app/login_page.dart';

//void main() {
// runApp(
//  MaterialApp(
// debugShowCheckedModeBanner: false,
//  home: PatientSignupPage(),
// ),
//);
//}

class PatientSignupPage extends StatefulWidget {
  const PatientSignupPage({super.key});

  @override
  State<PatientSignupPage> createState() => _PatientSignupPageState();
}

class _PatientSignupPageState extends State<PatientSignupPage> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  bool _obsecureText = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: maroon,
              ),
            );
          } else if (state is RegisterSuccess) {
            Navigator.push(
               context, MaterialPageRoute(builder: (context) => Verify()));
          } else if (state is RegisterFailure) {
            return Center(
              child: Text('Registration Failed: ${state.error}'),
            );
          }
          return SafeArea(
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
                      child: Text(
                        'Proceed with your',
                        style: TextStyle(
                            color: maroon,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend-Medium.ttf,'),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'REGISTRATION',
                        style: TextStyle(
                          color: maroon,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend-Medium.ttf',
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            prefixIcon: Icon(
                              Icons.contact_emergency,
                              color: maroon,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'email',
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: maroon,
                            ),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'phone',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: maroon,
                            ),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: idNumberController,
                          decoration: InputDecoration(
                            hintText: 'id',
                            prefixIcon: Icon(
                              Icons.perm_identity,
                              color: maroon,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            hintText: 'location',
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: maroon,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: passwordController,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: maroon,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: confirmPasswordController,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            hintText: 'confirm_password',
                            prefixIcon: Icon(
                              Icons.check,
                              color: maroon,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          final registerBloc =
                          BlocProvider.of<RegisterBloc>(context);
                          if(confirmPasswordController.text == passwordController.text){
                          registerBloc.add(RegisterButtonWhenPressed(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            idNumber: idNumberController.text,
                            location: locationController.text,
                            password: passwordController.text,
                            confirm_password: confirmPasswordController.text,
                          ));}
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Passwords do not match'),
                                  duration: Duration(seconds: 2,),

                                ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: maroon,
                        ),
                        child: Text(
                          'REGISTER',
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
          );
        },
      ),
    );
  }
}
