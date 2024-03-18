import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

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
      var response = await http.post(
        Uri.parse('https://d7b9-102-210-244-74.ngrok-free.app/api/chp/resetpassword'),
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
        emit(ResetPasswordFailure(error: 'reset password failed'));
      }
    } catch (e) {
      emit(ResetPasswordFailure(error: 'Error: $e'));
    }
  }
}
