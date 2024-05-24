import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String idNumber;
  final String email; // Add email field

  AuthAuthenticated({required this.idNumber, required this.email});
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void updateIdNumber(String idNumber) {
    emit(AuthAuthenticated(idNumber: idNumber, email: '')); // Add default email
    print('ID Number Updated: $idNumber'); // Log the idNumber
  }

  void updateUserData(String idNumber, String email) {
    // Emit the updated state with both idNumber and email
    emit(AuthAuthenticated(idNumber: idNumber, email: email));
    print('User Data Updated: idNumber - $idNumber, email - $email');
  }
}
