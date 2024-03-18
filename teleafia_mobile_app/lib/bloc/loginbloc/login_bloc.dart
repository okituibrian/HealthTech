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
        var response = await http.post(
          Uri.parse('https://3f41-102-210-244-74.ngrok-free.app/api/chp/login'),
          body: jsonEncode({
            'email': event.email,
            'password': event.password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: 'login failed'));
        }
      } catch (e) {
        emit(LoginFailure(error: 'Error: $e'));
      }
    }
      ); } }