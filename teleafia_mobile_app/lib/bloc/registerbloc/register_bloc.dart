import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonWhenPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        var response = await http.post(
          Uri.parse('https://1d34-102-210-244-74.ngrok-free.app/chp/register'),
          body: jsonEncode({
            'name': event.name,
            'email': event.email,
            'phoneNumber': event.phoneNumber,
            'idNumber': event.idNumber,
            'location': event.location,
            'password': event.password,
            'confirm_password': event.confirm_password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          emit(RegisterSuccess());
        } else {
          emit(RegisterFailure(error: 'not registered'));
        }
      } catch (e) {
        emit(RegisterFailure(error: 'Error: $e'));
      }
    });
  }
}

