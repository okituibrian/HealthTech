/*
import 'package:bloc/bloc.dart';
import '../../presentation/auth_storage_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthStorageService _authStorageService;

  AuthCubit(this._authStorageService) : super(AuthInitial()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final userData = await _authStorageService.getUserData();
    String? email = userData['email'];
    String? idNumber = userData['idNumber'];
    print('Loaded email: $email, idNumber: $idNumber');

    if (email != null && idNumber != null) {
      emit(AuthAuthenticated(email: email, idNumber: idNumber));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> updateUserData(String idNumber, String email) async {
    await _authStorageService.saveUserData(idNumber, email);
    print('Updated email: $email, idNumber: $idNumber');
    emit(AuthAuthenticated(email: email, idNumber: idNumber));
  }

  Future<void> logout() async {
    await _authStorageService.clearUserData();
    emit(AuthUnauthenticated());
  }
}
*/
