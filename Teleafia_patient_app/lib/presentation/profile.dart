import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teleafia_patient/presentation/api_call_functions.dart';
import 'package:teleafia_patient/presentation/medical_history.dart';
import 'package:teleafia_patient/presentation/my_appointments.dart';
import 'package:teleafia_patient/presentation/orders.dart';
import 'package:teleafia_patient/presentation/payments_screen.dart';
import 'package:teleafia_patient/presentation/settings.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

import 'loginpage.dart';

class HealthClientProfile extends StatefulWidget {
  final String? avatarSrc;
  final String? avatarSrcImageUrl;
  final VoidCallback? fetchImageCallback;

  const HealthClientProfile({Key? key, this.avatarSrc, this.avatarSrcImageUrl, this.fetchImageCallback}) : super(key: key);

  @override
  _HealthClientProfileState createState() => _HealthClientProfileState();
}

class _HealthClientProfileState extends State<HealthClientProfile> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color darkMaroon = const Color(0xFF850808);
  File? _avatarSrc;

  @override
  void initState() {
    super.initState();
    if (widget.avatarSrc != null) {
      _avatarSrc = File(widget.avatarSrc!);
    }
    if (widget.avatarSrcImageUrl != null) {
      _loadNetworkImage();
    }
  }

  Future<void> _loadNetworkImage() async {
    if (widget.avatarSrcImageUrl != null) {
      final response = await http.get(Uri.parse(widget.avatarSrcImageUrl!));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/avatar_image.jpg');
        await file.writeAsBytes(bytes);
        setState(() {
          _avatarSrc = file;
        });
      } else {
        // Handle error loading network image
        print('Failed to load network image. Status code: ${response.statusCode}');
      }
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      File selectedFile = File(file.path!);
      setState(() {
        _avatarSrc = selectedFile;
      });
      await ApiServices.uploadImage(selectedFile, context, widget.fetchImageCallback);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HealthClientHeader(heading: 'Profile'),
            GestureDetector(
              onTap: _pickFile,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _avatarSrc != null
                    ? FileImage(_avatarSrc!) as ImageProvider<Object>
                    : widget.avatarSrcImageUrl != null
                    ? NetworkImage(widget.avatarSrcImageUrl!)
                    : AssetImage('assets/default_profile.PNG') as ImageProvider<Object>,
              ),
            ),
            SizedBox(height: 10),
            MedicalServicesFunctions().customListTile(
              text: 'My History',
              imagePath: 'assets/my_history.PNG',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicalHistory(),
                  ),
                );
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'My Appointments',
              imagePath: 'assets/my_appointmentsP.PNG',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAppointments(),
                  ),
                );
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Payments',
              imagePath: 'assets/paymentsP.PNG',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPayments(),
                  ),
                );
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Settings',
              imagePath: 'assets/settings.PNG',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySettings(),
                  ),
                );
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'My Orders',
              imagePath: 'assets/my_orders.PNG',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyOrders(),
                  ),
                );
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'My Messages',
              imagePath: 'assets/my_messages.PNG',
              onTap: () {

              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Support',
              imagePath: 'assets/help.PNG',
              onTap: () {
                // Add your onTap functionality here
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Logout',
              imagePath: 'assets/logout.PNG',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Are you sure you want to logout?',
                        style: TextStyle(color: maroon),),
                      content: Text('please confirm by clicking OK',
                        style: TextStyle(color: Colors.black),),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(avatarSrcImageUrl: widget.avatarSrcImageUrl),
    );
  }
}
