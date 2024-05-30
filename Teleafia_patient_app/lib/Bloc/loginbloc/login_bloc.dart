import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../presentation/user_data_manager.dart';
import 'package:teleafia_patient/presentation/api_call_functions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonWhenPressedWithEmail>((event, emit) async {
      emit(LoginLoading());
      try {
        var response = await http.post(
          Uri.parse('${ApiServices.ngrokLink}/api/login'),
          body: jsonEncode({
            'email': event.email,
            'password': event.password,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          print('Success: ${response.statusCode}  : ${response.body}');
          final responseData= jsonDecode(response.body);
          final userData = responseData['user'];

          UserDataManager().updateUserData(userData);
          emit(LoginSuccess());
        } else if (response.statusCode == 409) {
          print('Failed: ${response.statusCode} => Account not verified');
          emit(LoginEmailNotVerified(error: 'Account not verified'));
        } else {
          print('${response.statusCode} => Not Found');
          emit(LoginFailure(error: 'login failed'));
        }
      } catch (e) {
        print('Error: $e');
        emit(LoginFailure(error: 'Error: $e'));
      }
    });
  }
}
