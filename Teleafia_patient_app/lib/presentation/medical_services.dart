import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/doctors_consultation.dart';
import 'package:teleafia_patient/presentation/modern_lab.dart';
import 'package:teleafia_patient/presentation/pharmacy_overview.dart';
import 'package:teleafia_patient/presentation/specialists.dart';
import 'package:teleafia_patient/presentation/well_baby_clinic.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class MedicalServices extends StatefulWidget {
  const MedicalServices({Key? key}) : super(key: key);

  @override
  State<MedicalServices> createState() => _MedicalServicesState();
}

class _MedicalServicesState extends State<MedicalServices> {
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
            HealthClientHeader(heading: 'Medical Services'),
            MedicalServicesFunctions().customListTile(
              text: 'Specialist Services',
              imagePath: 'assets/medical_services_icon.PNG',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SpecialistServices()));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Modern Laboratory',
              imagePath: 'assets/modern_laboratory.PNG',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ModernLaboratory()));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Pharmacy',
              imagePath: 'assets/pharmacy.PNG',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PharmacyOverview()));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: 'Well Baby Clinics',
              imagePath: 'assets/well_clinics.PNG',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WellBabyOverview()));
              },
            ),
            MedicalServicesFunctions().customListTile(
              text: "Doctor's consultation",
              imagePath: 'assets/physician.PNG',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorConsultationOverview()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }
}
