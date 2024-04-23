/*import 'package:flutter/material.dart';
//import 'package:teleafia_mobile_app/presentation/child_health_status.dart';
import 'package:teleafia_mobile_app/models.dart'; // Import CombinedFormData
import 'package:teleafia_mobile_app/presentation/preventive_medicine1.dart';
import 'package:teleafia_mobile_app/presentation/wash.dart';

class HouseholdIllness extends StatefulWidget {
  final CombinedFormData formData; // Add CombinedFormData here
  const HouseholdIllness({Key? key, required this.formData}) : super(key: key);

  @override
  State<HouseholdIllness> createState() => _HouseholdIllnessState();
}

class _HouseholdIllnessState extends State<HouseholdIllness> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);
  bool? checkBox1 = false;
  bool? checkBox2 = false;
  bool? checkBox3 = false;
  List <String> householdPreventiveMeasures = [];
  List <String> barriersToAccessingHealthCareServices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Center(
                child: Text(
                  'Household Health Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: darkmaroon,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: maroon,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: LinearProgressIndicator(
                  value: 0.5,
                  valueColor: AlwaysStoppedAnimation<Color>(maroon),
                  minHeight: 10.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Text(
                'Prevention and Health Practices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: darkmaroon,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 40,
              width: 900,
              child: Text(
                'What preventive measures does your household take to prevent'
                    ' the risk of illnesses?',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Handwashing with soap and water'),
                    value: householdPreventiveMeasures.contains('Handwashing with soap and water'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Handwashing with soap and water');
                        } else {
                          householdPreventiveMeasures.remove('Handwashing with soap and water');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Regular disinfection of surfaces'),
                    value: householdPreventiveMeasures.contains('Regular disinfection of surfaces'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Regular disinfection of surfaces');
                        } else {
                          householdPreventiveMeasures.remove('Regular disinfection of surfaces');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Vaccination'),
                    value: householdPreventiveMeasures.contains('Vaccination'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Vaccination');
                        } else {
                          householdPreventiveMeasures.remove('Vaccination');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Safe food handling practises'),
                    value: householdPreventiveMeasures.contains('Safe food handling practises'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Safe food handling practises');
                        } else {
                          householdPreventiveMeasures.remove('Safe food handling practises');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Adequate ventilation in living spaces'),
                    value: householdPreventiveMeasures.contains('Adequate ventilation in living spaces'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Adequate ventilation in living spaces');
                        } else {
                          householdPreventiveMeasures.remove('Adequate ventilation in living spaces');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Others'),
                    value: householdPreventiveMeasures.contains('Others'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Others');
                        } else {
                          householdPreventiveMeasures.remove('Others');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
              ],
            ),
            Row(
            ),
            SizedBox(height: 10.0),
            Container(
              child: Text(
                'Are there any barriers to accessing healthcare services'
                    ' for illnesses within your household?'
                    ' If yes, please specify',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Financial'),
                    value: barriersToAccessingHealthCareServices.contains('Financial'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          barriersToAccessingHealthCareServices.add('Financial');
                        } else {
                          barriersToAccessingHealthCareServices.remove('Financial');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Geographical'),
                    value: barriersToAccessingHealthCareServices.contains('Geographical'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          barriersToAccessingHealthCareServices.add('Geographical');
                        } else {
                          barriersToAccessingHealthCareServices.remove('Geographical');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Cultural'),
                    value: barriersToAccessingHealthCareServices.contains('Cultural'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          barriersToAccessingHealthCareServices.add('Cultural');
                        } else {
                          barriersToAccessingHealthCareServices.remove('Cultural');
                        }
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              'Child Health Status',
              style: TextStyle(
                color: maroon,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Kindly proceed to fill the health status for'
                  ' household children below the age of 5 years',
            ),
            SizedBox(height: 100.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wash(formData: widget.formData)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: maroon,
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
