// otp_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpService {
  static Future<void> requestOtp(String email) async {
    String apiUrl = 'https://41cf-102-210-244-74.ngrok-free.app/api/auth/patient/resendotp';
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
