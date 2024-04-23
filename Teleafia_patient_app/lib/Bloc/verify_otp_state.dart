part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}
final class VerifyOtpLoading extends VerifyOtpState {}
final class VerifyOtpSuccess extends VerifyOtpState {}
final class VerifyOtpFailure extends VerifyOtpState {
  final String error;
  VerifyOtpFailure({required this.error});
}


