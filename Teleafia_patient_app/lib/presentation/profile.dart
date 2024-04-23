import 'dart:io'; // Import dart:io for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teleafia_patient/presentation/medical_history.dart';
import 'package:teleafia_patient/presentation/my_appointments.dart';
import 'package:teleafia_patient/presentation/my_health_records.dart';
import 'package:teleafia_patient/presentation/settings.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class HealthClientProfile extends StatefulWidget {
  final XFile? imageFile;

  const HealthClientProfile({Key? key, this.imageFile}) : super(key: key);
  @override
  _HealthClientProfileState createState() => _HealthClientProfileState();
}

class _HealthClientProfileState extends State<HealthClientProfile> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);
  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    XFile? selected = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
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
              onTap: () => _pickImage(ImageSource.gallery),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageFile != null
                    ? FileImage(File(_imageFile!.path))
                    : AssetImage('assets/default_profile.PNG') as ImageProvider,
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
                    ));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'My Appointments',
              imagePath: 'assets/my_appointmentsP.PNG',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAppointments()));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Payments',
              imagePath: 'assets/paymentsP.PNG',
              onTap: () {
                // Add your onTap functionality here
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Settings',
              imagePath: 'assets/settings.PNG',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MySettings()));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'My Orders',
              imagePath: 'assets/my_orders.PNG',
              onTap: () {
                // Add your onTap functionality here
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'My Messages',
              imagePath: 'assets/my_messages.PNG',
              onTap: () {
                // Add your onTap functionality here
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
                // Add your onTap functionality here
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  @override
  void initState() {
    super.initState();
    _imageFile = widget.imageFile;
  }
}
