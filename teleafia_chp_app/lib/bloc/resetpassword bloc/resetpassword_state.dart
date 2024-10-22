
part of 'resetpassword_bloc.dart';
//part of 'resetpassword_event.dart' ;



@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  ResetPasswordFailure({required this.error});
}