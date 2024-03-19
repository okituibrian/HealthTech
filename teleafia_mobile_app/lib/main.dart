<<<<<<< HEAD
import 'package:teleafia_mobile_app/bloc/loginbloc/login_bloc.dart';
import 'package:teleafia_mobile_app/presentation/chp_signupform.dart';
=======
import 'package:equiafia/landingpage.dart';
>>>>>>> 9542cd594b8ce48e3e156c32837410dd35f657d1
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_mobile_app/presentation/landingpage.dart';
import 'package:teleafia_mobile_app/bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_mobile_app/presentation/forgotpassword_verifcation.dart';

void main() {
  runApp(
<<<<<<< HEAD
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
=======
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
>>>>>>> 9542cd594b8ce48e3e156c32837410dd35f657d1
    ),
  );
}
