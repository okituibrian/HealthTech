import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../presentation/api_call_functions.dart';
part  'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    on<SubmitVerifyOtp>(_onSubmitVerifyOtp);
  }

  Future<void> _onSubmitVerifyOtp(
      SubmitVerifyOtp event,
      Emitter<VerifyOtpState> emit,
      ) async {
    emit(VerifyOtpLoading());
    try {
      var response = await http.post(
        Uri.parse('${ApiServices.ngrokLink}/api/auth/patient/verifyotp'),
        body: jsonEncode({
          'enteredOtp': event.enteredOtp,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        emit(VerifyOtpSuccess());
      } else {
        print('${response.statusCode}');
        emit(VerifyOtpFailure(

            error: 'Please enter reset code and try again'));
      }
    } catch (e) {
      emit(VerifyOtpFailure(error: 'Failed to verify OTP: $e'));
    }
  }
}
