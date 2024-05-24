import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teleafia_patient/Bloc/cartbloc/cart_bloc.dart';
import 'package:teleafia_patient/Bloc/loginbloc/login_bloc.dart';
import 'package:teleafia_patient/Bloc/registerbloc/auth_cubit.dart';
import 'package:teleafia_patient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_patient/presentation/landingpage.dart';
import 'e-dawa cart/cart_provider.dart';

void main() {
  final authCubit = AuthCubit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(authCubit),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(authCubit),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(context),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => authCubit,
        ),
      ],
      child: ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Welcome(),
        ),
      ),
    ),
  );
}
