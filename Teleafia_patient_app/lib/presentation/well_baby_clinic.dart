import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/appointment_booking.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';


class WellBabyOverview extends StatefulWidget {
  const WellBabyOverview({Key? key}) : super(key: key);

  @override
  State<WellBabyOverview> createState() => _PharmacyOverviewState();
}

class _PharmacyOverviewState extends State<WellBabyOverview> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  String? wellBabyClinicsOverview =
      '''Our well baby clinics promote Optimal, emotional and intellectual
       growth and development. These holistic services include routine immunizations,
        screening procedures for early detection and treatment of illness, parental guidance
         and instruction in proper nutrition, accident prevention and specific care and rearing
          of the child at various stages of development. ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HealthClientHeader(heading: 'Well Baby Clinics'),
            MedicalServicesOverview()
                .medicalServicesOverview(overview: '$wellBabyClinicsOverview', booking: bookAppointment)
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
