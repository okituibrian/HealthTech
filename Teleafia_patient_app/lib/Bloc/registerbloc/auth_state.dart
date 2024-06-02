/*
import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String email;
  final String idNumber;

  AuthAuthenticated({required this.email, required this.idNumber});
}

class AuthUnauthenticated extends AuthState {}
*//*


import 'package:flutter/material.dart';

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final TextEditingController phoneNumberController = TextEditingController();
  final List<String> countryCodes = ['+1', '+44', '+254', '+91', '+61']; // Add more country codes as needed
  String selectedCountryCode = '+254'; // Default to Kenya's code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Input'),
        backgroundColor: Colors.maroon,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.maroon),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButton<String>(
                value: selectedCountryCode,
                icon: Icon(Icons.arrow_drop_down),
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountryCode = newValue!;
                  });
                },
                items: countryCodes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.maroon,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.maroon,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PhoneNumberInput(),
  ));
}
*/
