import 'package:teleafia_mobile_app/bloc/loginbloc/login_bloc.dart';
import 'package:teleafia_mobile_app/presentation/chp_signupform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_mobile_app/presentation/landingpage.dart';
import 'package:teleafia_mobile_app/bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_mobile_app/presentation/forgotpassword_verifcation.dart';

void main() {
  runApp(
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
    ),
  );
}
