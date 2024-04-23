import 'package:flutter/material.dart';

import 'package:teleafia_patient/presentation/appointment_booking.dart';
import 'package:teleafia_patient/presentation/medical_services.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class DoctorConsultationOverview extends StatefulWidget {
  const DoctorConsultationOverview({Key? key}) : super(key: key);

  @override
  State<DoctorConsultationOverview> createState() => _DoctorConsultationOverviewState();
}

class _DoctorConsultationOverviewState extends State<DoctorConsultationOverview> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  String? doctorConsultationOverview =
      """Equity Afia offers quality doctors consultation, nursing care and excellent client services. 
      Additionally, we use World Health Organization (WHO)’s recommended standardized care protocols. 
      Our doctors have exceptional skills in patient education, emergency medicine and follow-up on longterm
       clinical conditions for both communicable and noncommunicable diseases, including, diabetes, hypertension,
        HIV and AIDS, asthma, arthritis. Equity Afia provides primary healthcare with a focus on preventative services
         including adolescent health, men’s health, maternal and child healthOur nursing department is the medical centres
          backbone that gives patients a positive medical experience and a conducive environment for quick recovery.""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            HealthClientHeader(heading: 'Well Baby Clinics'),
            
            MedicalServicesOverview()
                .medicalServicesOverview(overview: '$doctorConsultationOverview',booking: bookAppointment)
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
