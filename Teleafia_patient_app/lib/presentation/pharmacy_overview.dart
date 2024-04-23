import 'package:flutter/material.dart';

import 'package:teleafia_patient/presentation/appointment_booking.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class PharmacyOverview extends StatefulWidget {
  const PharmacyOverview({Key? key}) : super(key: key);

  @override
  State<PharmacyOverview> createState() => _PharmacyOverviewState();
}

class _PharmacyOverviewState extends State<PharmacyOverview> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  String? pharmacyOverview =
      '''Our pharmacy is equipped with quality, affordable medication provided by professional, 
      highly qualified and certified staff. Our knowledgeable 
      staff explain to patients the details of their medication
       in a way that is easy to understand and simple to follow. 
       Guidance is always provided on accurate usage including 
       age-based dosage, frequency of use, route of administration, 
       storage of potential interactions and any adverse side effects.
       Equity Afia only procures medication from suppliers registered with 
       the Kenya Pharmacy and Poisons Board, assuring that patients get quality 
       medication at all times. ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            HealthClientHeader(heading: 'Pharmacy'),
            MedicalServicesOverview().medicalServicesOverview(
                overview: '$pharmacyOverview', booking: bookAppointment)
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
