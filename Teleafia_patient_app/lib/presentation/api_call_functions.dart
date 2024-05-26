import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'notifications.dart';

class ApiServices{
  static Future<String> fetchProfileImage() async {
    final response = await http.get(Uri.parse('https://710a-102-219-210-70.ngrok-free.app/api/patient/getProfileImage/12345'));

    if (response.statusCode == 200) {
      print('Success: ${response.statusCode} => Image fetched successfully');
      var jsonResponse = json.decode(response.body);
      return jsonResponse['avatarSrcImageUrl'];
    } else {
      print('Error: ${response.statusCode} => ${response.reasonPhrase}');
      throw Exception('Failed to load profile image');
    }
  }



 static Future<void> fetchNotifications(BuildContext context) async {
    try {
      final response = await http.get(
          Uri.parse('https://710a-102-219-210-70.ngrok-free.app/api/notifications/getallnotifications/123456'));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['notifications'] != null &&
            responseData['notifications'].isNotEmpty) {
          // Assuming the message is in the first item of the notifications list
          var message = responseData['notifications'][0]['message'];
          print(message);
          // Pass the notifications data to the destination widget
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HealthClientNotifications(message: message)),
          );
        } else {
          throw Exception('No notifications found');
        }
      } else {
        throw Exception('Failed to fetch notifications');
      }
    } catch (e) {
      print('Error: $e');
    }
  }



}


