part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpEvent {}

class SubmitVerifyOtp extends VerifyOtpEvent {
  final String enteredOtp;

  SubmitVerifyOtp({required this.enteredOtp});
}
