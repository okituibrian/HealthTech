import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'auth_cubit.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthCubit authCubit;

  RegisterBloc(this.authCubit) : super(RegisterInitial()) {
    on<RegisterButtonWhenPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        var response = await http.post(
          Uri.parse('https://6203-102-210-244-74.ngrok-free.app/api/auth/patient/register'),
          body: jsonEncode({
            'name': event.name,
            'email': event.email,
            'phoneNumber': event.phoneNumber,
            'idNumber': event.idNumber, // Include the idNumber here
            'location': event.location,
            'password': event.password,
            'confirm_password': event.confirm_password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          print('Success: ${response.statusCode}');
          authCubit.updateIdNumber(event.idNumber);
          emit(RegisterSuccess());
        } else {
          print('${response.statusCode} => ${response.reasonPhrase}');
          emit(RegisterFailure(error: 'Error: ${response.reasonPhrase}'));
        }
      } catch (e) {
        print('Error: $e');
        emit(RegisterFailure(error: 'Error: $e'));
      }
    });
  }
}

