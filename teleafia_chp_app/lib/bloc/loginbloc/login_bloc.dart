import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonWhenPressedWithEmail>((event, emit) async {
      emit(LoginLoading());
      try {
        var error;
        var response = await http.post(
          Uri.parse('https://a939-102-210-244-74.ngrok-free.app/api/login'),
          body: jsonEncode({
            'email': event.email,
            'password': event.password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          emit(LoginSuccess());
        } else if (response.statusCode == 409){
          emit(ChangePasswordRequiredState());
        } else if (response.statusCode == 403) {
          var error = jsonDecode(response.body)['error'];
          if (error == 'You have exceeded the maximum number of login attempts. Please click Forgot password below to reset your password.') {
            emit(LoginFailure(error: error));
          } else if ( error == 'Wrong password. Input the correct password or reset your password.') {
            emit(LoginFailure(error: error));
          } else if (error == 'Password expired! Please reset password.') {
            emit(LoginFailure(error: error));
          }
        }else if (response.statusCode == 404) {
          var error = jsonDecode(response.body)['error'];
          if (error == 'Wrong email. Kindly confirm your email') {
            emit(LoginFailure(error: error));
          }
        }
        else {
          emit(LoginFailure(error: 'login failed'));
        }
      } catch (e) {
        emit(LoginFailure(error: 'Error: $e'));
      }
    }
      ); } }