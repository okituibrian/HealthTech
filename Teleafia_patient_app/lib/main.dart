import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teleafia_patient/Bloc/cartbloc/cart_bloc.dart';
import 'package:teleafia_patient/Bloc/loginbloc/login_bloc.dart';
import 'package:teleafia_patient/Bloc/registerbloc/auth_cubit.dart';
import 'package:teleafia_patient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_patient/presentation/auth_storage_service.dart';
import 'package:teleafia_patient/presentation/landingpage.dart';
import 'Bloc/verify_otp_bloc.dart';
import 'e-dawa cart/cart_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(context),
        ),

      ],
      child: ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: Welcome(),
        ),
      ),
    ),
  );
}
