import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_mobile_app/resetpassword_bloc.dart';

import 'loginpage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

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
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.96,
            child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
              builder: (context, state) { if (state is ResetPasswordSuccess) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              } else if (state is ResetPasswordFailure) {
                return Center(
                  child: Text('Reset Password Failed: ${state.error}'),
                );
              }
                return Column(
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
                    Text('Reset Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    TextField(
                      controller: resetCodeController,
                      decoration: InputDecoration(
                        hintText: 'Enter Reset Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<ResetPasswordBloc>(context).add(
                          SubmitResetPassword(
                            resetCode: resetCodeController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          ),
                        );
                      },
                      style: TextButton.styleFrom(backgroundColor: maroon),
                      child: Text('Reset', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white)),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
