import 'package:flutter/material.dart';
//import 'package:teleafia_mobile_app/presentation/child_health_status.dart';
import 'package:teleafia_chp_app/models.dart'; // Import CombinedFormData
import 'package:teleafia_chp_app/presentation/preventive_medicine1.dart';
import 'package:teleafia_chp_app/presentation/wash.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


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
          'https://05a0-102-210-244-74.ngrok-free.app/api/create/household');
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
      appBar: AppBar(
        title: Center(
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
        ),
      ),
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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
            Text(
              'Prevention and Health Practices',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: darkmaroon,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'What preventive measures does your household take to prevent'
                  ' the risk of illnesses?',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child:CheckboxListTile(
                          title: Text('Hand washing with soap and water'),
                      value: householdPreventiveMeasures.contains('Hand washing with soap and water)'),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            householdPreventiveMeasures.add('Hand washing with soap and water');
                          } else {
                            householdPreventiveMeasures.remove('Hand washing with soap and water');
                          }
                          widget.formData.householdHealthProfileData.householdPreventiveMeasures = householdPreventiveMeasures;
                        });
        },
        activeColor: maroon,
      ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Regular disinfection of surfaces'),
                    value: householdPreventiveMeasures.contains('Regular disinfection of surfaces'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Regular disinfection of surfaces');
                        } else {
                          householdPreventiveMeasures.remove('Regular disinfection of surfaces');
                        }
                        widget.formData.householdHealthProfileData.householdPreventiveMeasures = householdPreventiveMeasures;
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Vaccination'),
                    value: householdPreventiveMeasures.contains('Vaccination'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Vaccination');
                        } else {
                          householdPreventiveMeasures.remove('Vaccination');
                        }
                        widget.formData.householdHealthProfileData.householdPreventiveMeasures = householdPreventiveMeasures;
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Safe food handling practises'),
                    value: householdPreventiveMeasures.contains('Safe food handling practises'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Safe food handling practises');
                        } else {
                          householdPreventiveMeasures.remove('Safe food handling practises');
                        }
                        widget.formData.householdHealthProfileData.householdPreventiveMeasures = householdPreventiveMeasures;
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Adequate vwntilation in living spaces'),
                    value: householdPreventiveMeasures.contains('Adequate vwntilation in living spaces'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Adequate vwntilation in living spaces');
                        } else {
                          householdPreventiveMeasures.remove('Adequate vwntilation in living spaces');
                        }
                        widget.formData.householdHealthProfileData.householdPreventiveMeasures = householdPreventiveMeasures;
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Others'),
                    value: householdPreventiveMeasures.contains('Others'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          householdPreventiveMeasures.add('Others');
                        } else {
                          householdPreventiveMeasures.remove('Others');
                        }
                        widget.formData.householdHealthProfileData.householdPreventiveMeasures = householdPreventiveMeasures;
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
                  child:CheckboxListTile(
                    title: Text('Financial'),
                    value: householdPreventiveMeasures.contains('Financial'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          barriersToAccessingHealthCareServices.add('Financial');
                        } else {
                          barriersToAccessingHealthCareServices.remove('Financial');
                        }
                        widget.formData.householdHealthProfileData.barriersToAccessingHealthCareServices = barriersToAccessingHealthCareServices;
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Geographical'),
                    value: householdPreventiveMeasures.contains('Geographical'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          barriersToAccessingHealthCareServices.add('Geographical');
                        } else {
                          barriersToAccessingHealthCareServices.remove('Geographical');
                        }
                        widget.formData.householdHealthProfileData.barriersToAccessingHealthCareServices = barriersToAccessingHealthCareServices;
                      });
                    },
                    activeColor: maroon,
                  ),
                ),
                Expanded(
                  child:CheckboxListTile(
                    title: Text('Cultural'),
                    value: householdPreventiveMeasures.contains('Cultural'),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          barriersToAccessingHealthCareServices.add('Cultural');
                        } else {
                          barriersToAccessingHealthCareServices.remove('Cultural');
                        }
                        widget.formData.householdHealthProfileData.barriersToAccessingHealthCareServices = barriersToAccessingHealthCareServices;
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
    );
  }
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

  // Check if wash data is valid
   /*bool isWashDataValid =
        formData.washData.sourceOfDrinkingWater?.isNotEmpty == true &&
            formData.washData.reliabilityOfWaterSupply?.isNotEmpty == true &&
            formData.washData.treatingConsumptionWater?.isNotEmpty == true &&
            formData.washData.waterTreatmentMethods?.isNotEmpty == true &&
            formData.washData.typeOfSanitationFacility?.isNotEmpty == true &&
            formData.washData.shareOfSanitationFacility?.isNotEmpty == true &&
            formData.washData.cleaningFrequencyOfSanitationFacility
                ?.isNotEmpty ==
                true &&
            formData.washData.accessibilityOfHandWashingFacility?.isNotEmpty ==
                true &&
            formData.washData.householdMemberHandWashingFrequency?.isNotEmpty ==
                true;*/

  return isHouseholdDetailsValid &&
      isSocioEconomicValid &&
      isHouseholdIllnessValid;// &&
  //isWashDataValid;
}


