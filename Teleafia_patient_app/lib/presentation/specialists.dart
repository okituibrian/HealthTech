import 'package:flutter/material.dart';

import 'package:teleafia_patient/presentation/appointment_booking.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class SpecialistServices extends StatefulWidget {
  const SpecialistServices({Key? key}) : super(key: key);

  @override
  State<SpecialistServices> createState() => _SpecialistServicesState();
}

class _SpecialistServicesState extends State<SpecialistServices> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  Color darkMaron = Color(0XFF850808);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HealthClientHeader(heading: 'Specialist Services'),
            MedicalServicesFunctions().customListTile(
              text: 'Physician',
              imagePath: 'assets/physician.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Ophthalmologist & Optical',
              imagePath: 'assets/ophthalmo.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Physiotherapy',
              imagePath: 'assets/physiotherapy.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Dental',
              imagePath: 'assets/dental.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Minor Surgical',
              imagePath: 'assets/surgical.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Urology',
              imagePath: 'assets/urology.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'ENT',
              imagePath: 'assets/ENT.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Orthopedics',
              imagePath: 'assets/physiotherapy.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Pediatric',
              imagePath: 'assets/pediatrics.PNG',
              onTap: () {
                bookAppointment();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  void bookAppointment() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => BookAppointment())));
  }
}
