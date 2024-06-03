import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../presentation/api_call_functions.dart';
import 'auth_cubit.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {


  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonWhenPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        var response = await http.post(
          Uri.parse('${ApiServices.ngrokLink}/api/auth/patient/register'),
          body: jsonEncode({
            'name': event.name,
            'email': event.email,
            'phoneNumber': event.phoneNumber,
            'idNumber': event.idNumber,
            'dateOfBirth': event.dateOfBirth,
            'location': event.location,
            'gender': event.gender,
            'password': event.password,
            'confirm_password': event.confirm_password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          print('Success: ${response.statusCode}');

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

