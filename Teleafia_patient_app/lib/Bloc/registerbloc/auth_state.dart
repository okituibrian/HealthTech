part of 'auth_cubit.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final String idNumber;

  AuthAuthenticated({required this.idNumber});
}