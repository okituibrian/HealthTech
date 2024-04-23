import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_chp_app/presentation/loginpage.dart';
import 'package:teleafia_chp_app/bloc/resetpassword bloc/resetpassword_bloc.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  bool _obsecureText = true;
  final TextEditingController resetCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(),
      child: Scaffold(
        body: Center(
          child: Container(
            color: background,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Reset Password Failed: ${state.error}'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Timer(Duration(seconds: 3), () {
                    Navigator.pop(context); // Navigate back to reset password page
                  });
                }
                else if (state is ResetPasswordSuccess) {
                  resetCodeController.clear();
                  passwordController.clear();
                  confirmPasswordController.clear();

                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  });
                }
              },
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
                  SizedBox(height: 2.0),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: resetCodeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Reset Code',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(10.0,),
                        hintText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Confirm Password',
                        contentPadding: EdgeInsets.all(10.0,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),

                  BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                    builder: (context, state) {
                      if (state is ResetPasswordLoading) {
                        return CircularProgressIndicator(
                          color: maroon,
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            final resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);
                            if (passwordController.text == confirmPasswordController.text) {
                              resetPasswordBloc.add(
                                SubmitResetPassword(
                                  resetCode: resetCodeController.text,
                                  password: passwordController.text,
                                  confirmPassword: confirmPasswordController.text,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Passwords do not match'),
                                  duration: Duration(seconds: 2,),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: maroon),
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
