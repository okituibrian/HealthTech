
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_call_functions.dart';

class OtpService {
  static Future<void> requestOtp(String email) async {
    String apiUrl = '${ApiServices.ngrokLink}/api/auth/patient/resendotp';
    Map<String, String> data = {
      'email': email,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print("OTP sent successfully");
      } else {
        throw Exception('Failed to send OTP');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
