import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../registerbloc/auth_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthCubit authCubit;

  LoginBloc(this.authCubit) : super(LoginInitial()) {
    on<LoginButtonWhenPressedWithEmail>((event, emit) async {
      emit(LoginLoading());
      try {
        var response = await http.post(
          Uri.parse('https://41cf-102-210-244-74.ngrok-free.app/api/login'),
          body: jsonEncode({
            'email': event.email,
            'password': event.password,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          print('Success: ${response.statusCode}');
          final authState = authCubit.state;
          if (authState is AuthAuthenticated) {
            print('Email: ${authState.email}, ID Number: ${authState.idNumber}');
            emit(LoginSuccess());
          }
          final emailAuthenticated = true; // Placeholder for authentication check
          if (emailAuthenticated) {
            print("Email authenticated");
            emit(LoginSuccess());
          }
        }

        else if (response.statusCode == 409) {
          print('Failed: ${response.statusCode} => Account not verified');
          emit(LoginEmailNotVerified(error: 'Account not verified'));
        } else {
          print('${response.statusCode} => Not Found');
          emit(LoginFailure(error: 'login failed'));
        }
      } catch (e) {
        print('Error: $e');
        emit(LoginFailure(error: 'Error: $e'));
      }
    });
  }
}

