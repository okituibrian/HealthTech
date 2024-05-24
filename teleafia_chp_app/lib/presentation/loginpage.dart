import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_chp_app/presentation/changepassword.dart';
import 'package:teleafia_chp_app/presentation/chp_dashboard.dart';
import 'package:teleafia_chp_app/presentation/forgotpassword.dart';
import 'package:teleafia_chp_app/bloc/loginbloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF4F4),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  title: Text(
                    'Error',
                    style: TextStyle(
                      color: maroon,
                    ),
                  ),
                  content: Text(
                    state.error,
                    style: TextStyle(
                      color: maroon,
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK',style: TextStyle(color: Colors.white,),),
                      style: TextButton.styleFrom(
                        backgroundColor: maroon,
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is LoginSuccess) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ChpDashboard()),
              );
            });
          } else if (state is ChangePasswordRequiredState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()),);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xFF982B15),
              ),
            );
          } else {
            return SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                color: Color(0xFFFCF4F4),
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 200,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/Hosp.jpg',
                        width: 500,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        'Proceed With your',
                        style: TextStyle(
                          color: Color(0xFF982B15),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFF982B15),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    if (errorMessage != null)
                      Center(
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.contact_emergency,
                            color: Color(0xFF982B15),
                          ),
                          hintText: 'Email',
                          labelText: 'Email',
                          contentPadding: EdgeInsets.all(10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFF982B15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFF982B15)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF982B15),
                          ),
                          hintText: 'Password',
                          labelText: 'password',
                          contentPadding: EdgeInsets.all(10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFF982B15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFF982B15)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        final loginBloc = BlocProvider.of<LoginBloc>(context);
                        String email = emailController.text;
                        String password = passwordController.text;

                        if (email.isNotEmpty && password.isNotEmpty) {
                          loginBloc.add(LoginButtonWhenPressedWithEmail(
                            email: email,
                            password: password,
                          ));
                          emailController.clear();
                          passwordController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter email and password'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF982B15),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF982B15),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
