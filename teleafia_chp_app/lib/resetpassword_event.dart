part of 'resetpassword_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class SubmitResetPassword extends ResetPasswordEvent {
  final String resetCode;
  final String password;
  final String confirmPassword;
  

  SubmitResetPassword({required this.resetCode, required this.password, required this.confirmPassword});

  bool doPasswordsMatch() {
    return password == confirmPassword;
  }
  String getSinglePassword() {
    return password;
  }
}