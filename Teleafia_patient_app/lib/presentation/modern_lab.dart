import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/appointment_booking.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class ModernLaboratory extends StatefulWidget {
  const ModernLaboratory({Key? key}) : super(key: key);

  @override
  State<ModernLaboratory> createState() => _ModernLaboratoryState();
}

class _ModernLaboratoryState extends State<ModernLaboratory> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  String? modernLabOverview =
      '''Our laboratory is equipped with modern equipment and 
  is operated by experienced and efficient laboratory technologists. 
  Equity Afia has developed and implemented a comprehensive quality assurance 
  program that address all aspects of specimen testing including; requisition, 
  patient identification/preparation, sample collection and storage, processing, 
  validation and interpretation of patient test results and regular internal audits. 
  Our process assures staff and patients that laboratory test results are reliable, 
  reproducible and relevant. ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            HealthClientHeader(heading: 'Modern Laboratory'),
            
            MedicalServicesOverview().medicalServicesOverview(
                overview: '$modernLabOverview', booking: bookAppointment)
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
