import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void authenticate(String idNumber) {
    emit(AuthAuthenticated(idNumber: idNumber));
  }

  void updateIdNumber(String idNumber) {
    emit(idNumber as AuthState);
  }
}
