import 'package:teleafia_mobile_app/chp_signupform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_mobile_app/register_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => RegisterBloc(),
      child: MaterialApp(
        home: PatientSignupPage(),
      ),
    ),
  );
}
