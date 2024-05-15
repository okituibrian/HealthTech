import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
        Uri.parse('https://3b88-102-210-244-74.ngrok-free.app/api/auth/patient/verifyotp'),
        body: jsonEncode({
          'enteredOtp': event.enteredOtp,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        emit(VerifyOtpSuccess());
      } else {
        emit(VerifyOtpFailure(
            error: 'Please enter reset code and try again'));
      }
    } catch (e) {
      emit(VerifyOtpFailure(error: 'Failed to verify OTP: $e'));
    }
  }
}
