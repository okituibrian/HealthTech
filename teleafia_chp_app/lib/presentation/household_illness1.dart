/*import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/presentation/household_health_profile.dart';

import 'medical_report.dart';
import 'package:teleafia_mobile_app/models.dart';

class HouseHoldIllness1 extends StatefulWidget {
  final CombinedFormData formData;
  const HouseHoldIllness1({Key? key, required this.formData}) : super(key: key);

  @override
  State<HouseHoldIllness1> createState() => _HouseHoldIllness1State();
}

class _HouseHoldIllness1State extends State<HouseHoldIllness1> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);
  List<String> typeOfTreatmentSought = [];
  List<String> illnessTypesOfHouseholdMembers = [];

  double _progressValue = 0.4; // Set initial progress value
  String? _selectedOption1;
  List<String> _options1 = [
    'None',
    '1-2 Members',
    '2-3 Members',
    '3-4 Members',
    '5 or more Members',
  ];
  List<String> _options2 = [
    'Respiratory Infections',
    'Gastrointestinal Infections',
    'Skin Infections',
    'Chronic Conditions',
    'Mental Health Conditions',
    'Others (Specify)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: background,
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 200,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Household Illness',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: maroon,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      LinearProgressIndicator(
                        value: _progressValue,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(maroon),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Household Illness',
                    style: TextStyle(
                      color: maroon,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      'In the past months, how many members of your household have experienced illness symptoms (e.g., cough, fever, and diarrhea)?'),
                /*  SizedBox(height: 10.0),
                  Container(
                    height: 40.0,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          widget.formData.householdIllnessData
                              .householdMembersWithIllnessSymptoms = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Kindly select',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon, width: 1.0),
                        ),
                        suffixIcon: DropdownButton<String>(
                          hint: Text('Kindly select'),
                          value: _selectedOption1,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption1 = newValue;
                            });
                          },
                          items: _options1
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: maroon),
                              ),
                            );
                          }).toList(),
                          style: TextStyle(color: maroon),
                          dropdownColor: background,
                          icon: Icon(Icons.arrow_drop_down,
                              color: maroon), // Change the dropdown icon here
                          elevation: 2,
                          underline: SizedBox(), // Remove the underline
                          isExpanded: true,
                          iconSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      'What type of illness has affected your household members over the past months?'),
                  SizedBox(height: 20.0),
                  Column(
                    children: _options2
                        .map(
                          (option) => CheckboxListTile(
                        title: Text(option),
                        value: illnessTypesOfHouseholdMembers.contains(option),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              illnessTypesOfHouseholdMembers.add(option);
                            } else {
                              illnessTypesOfHouseholdMembers.remove(option);
                            }
                          });
                        },
                        activeColor: maroon,
                      ),
                    )
                        .toList(),
                  ),
                  SizedBox(height: 10.0),
                  Text('Did any household member require treatment for their illness?'),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes'),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData.householdMembersTreatmentRequirement,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.householdMembersTreatmentRequirement = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData.householdMembersTreatmentRequirement,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.householdMembersTreatmentRequirement = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Sometimes'),
                          value: 'Sometimes',
                          groupValue: widget.formData.householdIllnessData.householdMembersTreatmentRequirement,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.householdMembersTreatmentRequirement = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('If yes, please indicate the type of treatment sought'),
                  SizedBox(height: 20.0),
                  // Add CheckboxListTiles for treatment sought
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Is any household member currently sick?'),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes'),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData.householdMemberCurrentlySick,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.householdMemberCurrentlySick = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData.householdMemberCurrentlySick,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.householdMemberCurrentlySick = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('If YES, has he/she sought medical attention?'),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes'),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData.soughtMedicalAttention,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.soughtMedicalAttention = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData.soughtMedicalAttention,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.soughtMedicalAttention = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('If NO, is he/she ready to be referred to the nearby medical facility?'),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes'),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData.memberMedicalFacilityReferralConsent,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.memberMedicalFacilityReferralConsent = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData.memberMedicalFacilityReferralConsent,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData.memberMedicalFacilityReferralConsent = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('If YES, kindly proceed to fill the medical form?'),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalReport()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: background,
                          ),
                          child: Text(
                            'MEDICAL REPORTING FORM',
                            style: TextStyle(
                              color: maroon,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  */SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HouseholdIllness(formData: widget.formData)),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: maroon,
                    ),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

