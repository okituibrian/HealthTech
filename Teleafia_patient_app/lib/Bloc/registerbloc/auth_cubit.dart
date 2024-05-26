import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';


class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  AuthCubit() : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    String? email = await secureStorage.read(key: 'email');
    String? idNumber = await secureStorage.read(key: 'idNumber');

    if (email != null && idNumber != null) {
      emit(AuthAuthenticated(email: email, idNumber: idNumber));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> updateUserData(String idNumber, String email) async {
    await secureStorage.write(key: 'idNumber', value: idNumber);
    await secureStorage.write(key: 'email', value: email);
    emit(AuthAuthenticated(email: email, idNumber: idNumber));
  }

  Future<void> logout() async {
    await secureStorage.deleteAll();
    emit(AuthUnauthenticated());
  }
}



@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String email;
  final String idNumber;

  AuthAuthenticated({required this.email, required this.idNumber});
}

class AuthUnauthenticated extends AuthState {}
