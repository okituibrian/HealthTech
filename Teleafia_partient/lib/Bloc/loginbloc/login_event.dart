part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginButtonWhenPressedWithEmail extends LoginEvent {

  final String email;
  final String password;

  LoginButtonWhenPressedWithEmail({

    required this.email,
    required this.password,
});
}


