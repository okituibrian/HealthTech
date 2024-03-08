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


class LoginButtonWhenPressedWithPhone extends LoginEvent {

  final String phoneNumber;
  final String password;

  LoginButtonWhenPressedWithPhone({

    required this.phoneNumber,
    required this.password,
  });
}