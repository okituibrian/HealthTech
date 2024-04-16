part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginEmailNotVerified extends LoginState {
  final String error;
  LoginEmailNotVerified({
    required this.error,
});

}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({
    required this.error,
});

}

