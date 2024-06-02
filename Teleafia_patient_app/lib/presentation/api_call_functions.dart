import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teleafia_patient/presentation/user_data_manager.dart';
import 'notifications.dart';

class ApiServices {
  static String ngrokLink = 'https://80d2-102-219-210-70.ngrok-free.app';
  static String idNumber = '321456';

  static Future<String> fetchProfileImage() async {
    final response = await http.get(Uri.parse('$ngrokLink/api/patient/getProfileImage/${UserDataManager().idNumber}'));
    print('id = ${UserDataManager().idNumber}');
    if (response.statusCode == 200) {
      print('Success: ${response.statusCode} => Image fetched successfully');
      var jsonResponse = json.decode(response.body);
      return jsonResponse['avatarSrcImageUrl'];
    } else {

      print('Error: ${response.statusCode} => ${response.reasonPhrase}');
      throw Exception('Failed to load profile image');
    }
  }

  static Future<void> fetchNotifications(BuildContext context, void Function(int) updateNotificationCount) async {
    try {
      final response = await http.get(
        Uri.parse('$ngrokLink/api/notifications/getallnotifications/$idNumber'),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['notifications'] != null && responseData['notifications'].isNotEmpty) {
          var message = responseData['notifications'][0]['message'];
          print(message);

          // Update the notification count
          updateNotificationCount(responseData['notifications'].length);

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

  static Future<void> uploadImage(File? selected, BuildContext context, VoidCallback? fetchImageCallback) async {
    if (selected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected')),
      );
      return;
    }
    String apiUrl = '$ngrokLink/api/patient/uploadProfileImages/${UserDataManager().idNumber}';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath(
          'avatarSrc',
          selected.path,
          filename: path.basename(selected.path),
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Success: ${response.statusCode} => Image uploaded successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded successfully')),
        );
        fetchImageCallback?.call();
      } else {
        print('Error: ${response.statusCode} => ${response.reasonPhrase}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image: ${response.reasonPhrase}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  static Future<void> processPayment(BuildContext context, void Function(int) updateNotificationCount) async {

    await fetchNotifications(context, updateNotificationCount);
  }
}
