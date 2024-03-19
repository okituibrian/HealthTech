import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_mobile_app/presentation/changepassword.dart';
import 'package:teleafia_mobile_app/presentation/forgotpassword.dart';
import 'package:teleafia_mobile_app/bloc/loginbloc/login_bloc.dart';



import 'dart:async';

import '../bloc/loginbloc/login_bloc.dart';





class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Color maroon   = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  final TextEditingController emailController = TextEditingController();
  //final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: BlocBuilder<LoginBloc,LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: maroon,
              ),
            );
          } else if (state is LoginSuccess){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>ChangePassword()));
          } else if (state is LoginFailure) {
            SchedulerBinding.instance.addPostFrameCallback((_){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to login please try again'),
                  duration: Duration(seconds: 3,),
                ),
              );
            });
          }

          return SafeArea(
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
                    Center(
                      child: Text('Proceed With your',
                        style: TextStyle(
                          color: maroon,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ) ,

                    SizedBox (height: 5.0),

                    Center(
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
                        controller: emailController,
                        decoration: InputDecoration( prefixIcon:Icon(Icons.contact_emergency,
                            color: maroon),
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: maroon),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: maroon),

                          ),

                        ),
                      ),
                    ),

                    SizedBox(height:10.0) ,

                    Container(
                      height: 35.0,
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(prefixIcon:Icon(Icons.lock,
                            color: maroon),
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: maroon),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: maroon),

                          ),
                        ),

                      ),
                    ),

                    SizedBox(height: 10.0,)  ,

                    ElevatedButton(
                      onPressed: (){
                        final loginBloc = BlocProvider.of<LoginBloc>(context);
                        String email = emailController.text;
                        String password = passwordController.text;

                        //String password = passwordController.text;
                        if (email.isNotEmpty) {
                          loginBloc.add(LoginButtonWhenPressedWithEmail(email: email, password: password));
                          emailController.clear();
                          passwordController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter email'),
                              duration: Duration(seconds: 3,),
                            ),
                          );
                        }
                      },
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
                    /* SizedBox(height: 10.0),

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
            ),*/
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
