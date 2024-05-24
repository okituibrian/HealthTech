import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teleafia_chp_app/presentation/household_health_profile.dart';
import 'package:teleafia_chp_app/presentation/wash.dart';

import 'medical_report.dart';
import 'package:teleafia_chp_app/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  TextEditingController householdMembersWithIllnessSymptomsController = TextEditingController();

  double _progressValue = 0.4; // Set initial progress value
  String? _selectedOption1;
  List<String> _options1 = [
    'None',
    '1-2 Members',
    '2-3 Members',
    '3-4 Members',
    '5 or more Members',
  ];
  bool _isSubmitting = false;
  Future<void> _submitForm() async {
    // Validate form data
    if (_isFormDataValid(widget.formData)) {
      // Convert form data to JSON string
      String jsonData = jsonEncode(widget.formData.toJson());
      setState(() {
        _isSubmitting = true; // Set submitting state to true
      });

      // Post data to backend
      var url = Uri.parse(
          'https://41cf-102-210-244-74.ngrok-free.app/api/create/household');
      var response = await http.post(
        url,
        body: jsonData,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      setState(() {
        _isSubmitting = false; // Reset submitting state
      });

      // Check response status
      if (response.statusCode == 201) {
        // Data submitted successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form data submitted successfully')),
        );
        // Optionally, you can navigate to another screen or show a success message here
      } else {
        // Error submitting data
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
              'Error submitting form data: ${response.statusCode}')),
        );
      }
    } else {
      // Show error message if form data is incomplete
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields.')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Household Illness',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: maroon,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      'In the past months, how many members of your household have experienced illness symptoms (e.g., cough, fever, and diarrhea)?',
                    style:TextStyle(fontWeight:FontWeight.bold ),),
                  SizedBox(height: 10.0),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: TextEditingController(
                          text: widget.formData.householdIllnessData
                              .householdMembersWithIllnessSymptoms ?? ''),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Kindly select',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down, color: maroon),
                            itemBuilder: (BuildContext context) {
                              return _options1.map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                  onTap: () {
                                    setState(() {
                                      // Update selected value in form data
                                      widget.formData.householdIllnessData
                                          .householdMembersWithIllnessSymptoms =
                                          option;
                                      // Update text field controller
                                      householdMembersWithIllnessSymptomsController
                                          .text = option;
                                    });
                                  },
                                );
                              }).toList();
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),
                  Text(
                      'What type of illness has affected your household members over the past months?',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20.0),
                  CheckboxListTile(
                    title: Text('Respiratory infection',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: illnessTypesOfHouseholdMembers.contains(
                        'Respiratory infection'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          illnessTypesOfHouseholdMembers.add(
                              'Respiratory infection');
                        } else {
                          illnessTypesOfHouseholdMembers.remove(
                              'Respiratory infection');
                        }
                        widget.formData.householdIllnessData
                            .illnessTypesOfHouseholdMembers =
                            illnessTypesOfHouseholdMembers;
                      });
                    },
                    activeColor: maroon,
                  ),
                  CheckboxListTile(
                    title: Text('Gastrointestinal infection',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: illnessTypesOfHouseholdMembers.contains(
                        'Gastrointestinal infection'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          illnessTypesOfHouseholdMembers.add(
                              'Gastrointestinal infection');
                        } else {
                          illnessTypesOfHouseholdMembers.remove(
                              'Gastrointestinal infection');
                        }
                        widget.formData.householdIllnessData
                            .illnessTypesOfHouseholdMembers =
                            illnessTypesOfHouseholdMembers;
                      });
                    },
                    activeColor: maroon,
                  ),
                  CheckboxListTile(
                    title: Text('Skin infection',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: illnessTypesOfHouseholdMembers.contains(
                        'Skin infection'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          illnessTypesOfHouseholdMembers.add('Skin infection');
                        } else {
                          illnessTypesOfHouseholdMembers.remove(
                              'Skin infection');
                        }
                        widget.formData.householdIllnessData
                            .illnessTypesOfHouseholdMembers =
                            illnessTypesOfHouseholdMembers;
                      });
                    },
                    activeColor: maroon,
                  ),
                  CheckboxListTile(
                    title: Text('Chronic conditions',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: illnessTypesOfHouseholdMembers.contains(
                        'Chronic conditions'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          illnessTypesOfHouseholdMembers.add(
                              'Chronic conditions');
                        } else {
                          illnessTypesOfHouseholdMembers.remove(
                              'Chronic conditions');
                        }
                        widget.formData.householdIllnessData
                            .illnessTypesOfHouseholdMembers =
                            illnessTypesOfHouseholdMembers;
                      });
                    },
                    activeColor: maroon,
                  ),
                  CheckboxListTile(
                    title: Text('Mental Health Conditions',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: illnessTypesOfHouseholdMembers.contains(
                        'Mental Health Conditions'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          illnessTypesOfHouseholdMembers.add(
                              'Mental Health Conditions');
                        } else {
                          illnessTypesOfHouseholdMembers.remove(
                              'Mental Health Conditions');
                        }
                        widget.formData.householdIllnessData
                            .illnessTypesOfHouseholdMembers =
                            illnessTypesOfHouseholdMembers;
                      });
                    },
                    activeColor: maroon,
                  ),
                  CheckboxListTile(
                    title: Text('Others',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: illnessTypesOfHouseholdMembers.contains('Others'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          illnessTypesOfHouseholdMembers.add('Others');
                        } else {
                          illnessTypesOfHouseholdMembers.remove('Others');
                        }
                        widget.formData.householdIllnessData
                            .illnessTypesOfHouseholdMembers =
                            illnessTypesOfHouseholdMembers;
                      });
                    },
                    activeColor: maroon,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      'Did any household member require treatment for their illness?',style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes'),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData
                              .householdMembersTreatmentRequirement,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .householdMembersTreatmentRequirement =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData
                              .householdMembersTreatmentRequirement,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .householdMembersTreatmentRequirement =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Sometimes',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Sometimes',
                          groupValue: widget.formData.householdIllnessData
                              .householdMembersTreatmentRequirement,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .householdMembersTreatmentRequirement =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('If yes, please indicate the type of treatment sought',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20.0),
                  CheckboxListTile(
                    title: Text('Hospitalization',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: typeOfTreatmentSought.contains('Hospitalization'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          typeOfTreatmentSought.add('Hospitalization');
                        } else {
                          typeOfTreatmentSought.remove('Hospitalization');
                        }
                        widget.formData.householdIllnessData
                            .typeOfTreatmentSought = typeOfTreatmentSought;
                      });
                    },
                    activeColor: maroon,
                  ),
                  SizedBox(height: 20.0,),
                  CheckboxListTile(
                    title: Text('Visit a clinic',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: typeOfTreatmentSought.contains('Visit a clinic'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          typeOfTreatmentSought.add('Visit a clinic');
                        } else {
                          typeOfTreatmentSought.remove('Visit a clinic');
                        }
                        widget.formData.householdIllnessData
                            .typeOfTreatmentSought = typeOfTreatmentSought;
                      });
                    },
                    activeColor: maroon,
                  ),
                  CheckboxListTile(
                    title: Text('Home remedies',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: typeOfTreatmentSought.contains('Home remedies'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          typeOfTreatmentSought.add('Home remedies');
                        } else {
                          typeOfTreatmentSought.remove('Home remedies');
                        }
                        widget.formData.householdIllnessData
                            .typeOfTreatmentSought = typeOfTreatmentSought;
                      });
                    },
                    activeColor: maroon,
                  ),
                  // Add CheckboxListTiles for treatment sought
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Is any household member currently sick?',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData
                              .householdMemberCurrentlySick,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .householdMemberCurrentlySick = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData
                              .householdMemberCurrentlySick,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .householdMemberCurrentlySick = value ?? '';
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
                        child: Text(
                            'If YES, has he/she sought medical attention?',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData
                              .soughtMedicalAttention,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .soughtMedicalAttention = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData
                              .soughtMedicalAttention,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .soughtMedicalAttention = value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),

                  SizedBox(height: 10.0),

                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            'If NO, is he/she ready to be referred to the nearby medical facility?',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Yes',
                          groupValue: widget.formData.householdIllnessData
                              .memberMedicalFacilityReferralConsent,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .memberMedicalFacilityReferralConsent =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No',style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'No',
                          groupValue: widget.formData.householdIllnessData
                              .memberMedicalFacilityReferralConsent,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.householdIllnessData
                                  .memberMedicalFacilityReferralConsent =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _isSubmitting ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(200, 50),
                      ),
                      child: _isSubmitting
                          ? CircularProgressIndicator(
                        color: Colors
                            .white, // Change the color to match your design
                      )
                          : Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
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

  bool _isFormDataValid(CombinedFormData formData) {
    // Check if all required fields are filled for household details
    bool isHouseholdDetailsValid =
        formData.householdDetailsData.householdNumber?.isNotEmpty == true &&
            formData.householdDetailsData.nationality?.isNotEmpty == true &&
            formData.householdDetailsData.county?.isNotEmpty == true &&
            formData.householdDetailsData.subCounty?.isNotEmpty == true &&
            formData.householdDetailsData.constituency?.isNotEmpty == true &&
            formData.householdDetailsData.ward?.isNotEmpty == true &&
            formData.householdDetailsData.communityUnit?.isNotEmpty == true &&
            formData.householdDetailsData.householdSize?.isNotEmpty == true &&
            formData.householdDetailsData.numberOfUnderFive?.isNotEmpty == true;

    // Check if all required fields are filled for socio-economic data
    bool isSocioEconomicValid =
        formData.socioEconomicData.householdIncomeLevel?.isNotEmpty == true &&
            formData.socioEconomicData.householdAnnualIncome?.isNotEmpty ==
                true &&
            formData.socioEconomicData.householdPrimarySourceOfIncome
                ?.isNotEmpty ==
                true &&
            formData.socioEconomicData.typeOfResidence?.isNotEmpty == true &&
            formData.socioEconomicData.typeOfResidenceOwnership?.isNotEmpty ==
                true &&
            formData.socioEconomicData.householdAmmenities.isNotEmpty;

    // Check if household illness data is valid
    bool isHouseholdIllnessValid =
        formData.householdIllnessData.householdMembersWithIllnessSymptoms
            ?.isNotEmpty ==
            true &&
            formData.householdIllnessData.illnessTypesOfHouseholdMembers
                .isNotEmpty &&
            formData.householdIllnessData
                .householdMembersTreatmentRequirement !=
                null &&
            formData.householdIllnessData
                .memberMedicalFacilityReferralConsent !=
                null &&
            formData.householdIllnessData.householdMemberCurrentlySick !=
                null &&
            formData.householdIllnessData.soughtMedicalAttention != null &&
            formData.householdIllnessData.typeOfTreatmentSought.isNotEmpty;

    return isHouseholdDetailsValid &&
        isSocioEconomicValid &&
        isHouseholdIllnessValid;
  }
}