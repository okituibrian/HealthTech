part of 'register_bloc.dart';


@immutable
abstract class RegisterEvent {}

class RegisterButtonWhenPressed extends RegisterEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String idNumber;
  final String location;
  final String password;
  final String confirm_password;

  RegisterButtonWhenPressed({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.idNumber,
    required this.location,
    required this.password,
    required this.confirm_password,


  });
  bool doPasswordsMatch() {
    return password == confirm_password;
  }
  String getSinglePassword() {
    return password;
  }
}
