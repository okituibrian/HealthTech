import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_partient/Bloc/loginbloc/login_bloc.dart';
import 'package:teleafia_partient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_partient/presentation/landingpage.dart';


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