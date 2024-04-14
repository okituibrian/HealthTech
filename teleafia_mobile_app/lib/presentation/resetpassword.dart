import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_mobile_app/presentation/forgotpassword.dart';
import 'package:teleafia_mobile_app/resetpassword_bloc.dart';

import 'loginpage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  final TextEditingController resetCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            color: background,
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.96,
            child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed: ${state.error}'),
                      backgroundColor: Color(0xFF982B15),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordSuccess) {

                   Future.delayed(Duration.zero,
                           () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),
                  );
                  });

                }
                return Column(
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

                    Text(
                      'Reset Password',
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
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: maroon, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: maroon, width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: maroon, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: maroon, width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: maroon, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: maroon, width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    ElevatedButton(
                      onPressed: () {
                        String resetCode = resetCodeController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;

                        // Check if password and confirmPassword match
                        if (password != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Passwords do not match'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                            ),
                          );
                          return;
                        }

                        BlocProvider.of<ResetPasswordBloc>(context).add(
                          SubmitResetPassword(
                            resetCode: resetCode,
                            password: password,
                            confirmPassword: confirmPassword,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: maroon),
                      child: Text(
                        'Reset',
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 30.0,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: Text('Resend the code',
                            style: TextStyle(
                              color: maroon,

                            ),
                          ),
                        ),
                      ],
                    )
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
