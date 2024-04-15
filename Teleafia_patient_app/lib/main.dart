import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:teleafia_partient/Bloc/cartbloc/cart_bloc.dart'; // Import CartBloc
import 'package:teleafia_partient/Bloc/loginbloc/login_bloc.dart';
import 'package:teleafia_partient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_partient/presentation/landingpage.dart';

import 'e-dawa cart/cart_provider.dart';

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
        BlocProvider<CartBloc>( // Provide the CartBloc
          create: (context) => CartBloc(context),
        ),
      ],
      child: ChangeNotifierProvider<CartProvider>( // Instantiate ChangeNotifierProvider correctly
        create: (context) => CartProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Welcome(),
        ),
      ),
    ),
  );
}
