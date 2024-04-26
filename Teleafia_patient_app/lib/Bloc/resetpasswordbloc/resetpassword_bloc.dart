import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
part 'resetpassword_event.dart';
part 'resetpassword_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<SubmitResetPassword>(_onSubmitResetPassword);
  }

  Future<void> _onSubmitResetPassword(
      SubmitResetPassword event,
      Emitter<ResetPasswordState> emit,
      ) async {
    emit(ResetPasswordLoading());
    try {
      var response = await http.put(
        Uri.parse('https://861c-105-161-14-229.ngrok-free.app/api/resetpassword'),
        body: jsonEncode({
          'resetCode': event.resetCode,
          'password': event.password,
          'confirmPassword': event.confirmPassword,

        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailure(error: ' please enter reset code and try again'));
      }
    } catch (e) {
      emit(ResetPasswordFailure(error: 'Error: $e'));
    }
  }
}
