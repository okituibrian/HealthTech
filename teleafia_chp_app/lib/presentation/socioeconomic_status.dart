
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teleafia_chp_app/presentation/household_illness1.dart';
import 'package:teleafia_chp_app/presentation/wash.dart';
import 'package:teleafia_chp_app/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;




class SocioEconomic extends StatefulWidget {
  final CombinedFormData formData;
   SocioEconomic({Key? key, required this.formData}) : super(key: key);

  @override
  State<SocioEconomic> createState() => _SocioEconomicState();
}

class _SocioEconomicState extends State<SocioEconomic> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);
  bool _isSubmitting = false;

  double _progressValue = 0.2; // Set initial progress value
  //int _selectedRadio = -1;
  String? householdIncomeLevel;
  String? householdAnnualIncome;
  String? householdPrimarySourceOfIncome;
  String? typeOfResidence;
  String? typeOfResidenceOwnership;
  TextEditingController householdIncomeLevelController = TextEditingController();
  TextEditingController householdAnnualIncomeController = TextEditingController();
  TextEditingController householdPrimarySourceOfIncomeController = TextEditingController();
  TextEditingController typeOfResidenceController = TextEditingController();
  TextEditingController typeOfResidenceOwnershipController = TextEditingController();


  List <String> householdAmmenities = [];
  Future<void> _submitForm() async {
    // Validate form data
    if (_isFormDataValid(widget.formData)) {
      // Convert form data to JSON string
      String jsonData = jsonEncode(widget.formData.toJson());
      setState(() {
        _isSubmitting = true; // Set submitting state to true
      });

      // Post data to backend
      var url = Uri.parse('https://b3e3-102-210-244-74.ngrok-free.app/api/create/household');
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
          SnackBar(content: Text('Error submitting form data: ${response.statusCode}')),
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
        backgroundColor: background,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: background,
              padding: const EdgeInsets.all(5.0),
              child: Center(
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
                    const SizedBox(height: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Social economic status',
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
                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: TextEditingController(text: householdIncomeLevel ?? ''),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: 'Household income level',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down, color: maroon),
                              itemBuilder: (BuildContext context) {
                                return [
                                  'Below Poverty Line',
                                  'Low Income',
                                  'Moderate Income',
                                  'High Income',
                                  'Prefer Not to Say',
                                ].map((String option) {
                                  return PopupMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList();
                              },
                              onSelected: (String? value) {
                                setState(() {
                                  householdIncomeLevel = value; // Update selected value
                                  // Update text field controller
                                  householdIncomeLevelController.text = value ?? '';
                                  // Update formData
                                  widget.formData.socioEconomicData.householdIncomeLevel = value?? '';
                                });
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


                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: TextEditingController(text: householdAnnualIncome?? ''),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                            hintText: 'Household Annual Income',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down, color: maroon,),
                              itemBuilder: (BuildContext context) {
                                return [
                                  'ksh 10000 - ksh 20000',
                                  'ksh 20000 - ksh 30000',
                                  'ksh 30000 - ksh 40000',
                                  'More than  ksh 30000',
                                ].map((String option) {
                                  return PopupMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList();
                              },
                              onSelected: (String? value) {
                                setState(() {
                                  householdAnnualIncome = value; // Update selected value
                                  // Update text field controller
                                  householdAnnualIncomeController.text = value ?? '';
                                  //update formData
                                  widget.formData.socioEconomicData.householdAnnualIncome = value?? '';
                                });
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


                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: TextEditingController(text: householdPrimarySourceOfIncome?? ''),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: 'Household Primary source of Income',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down, color: maroon,),
                              itemBuilder: (BuildContext context) {
                                return [
                                  'Employment / Salary',
                                  'Self-Employment / Business',
                                  'Govt Assistant',
                                  'Retirement / Pension',
                                ].map((String option) {
                                  return PopupMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList();
                              },
                              onSelected: (String? value) {
                                setState(() {
                                  householdPrimarySourceOfIncome = value; // Update selected value
                                  // Update text field controller
                                  householdPrimarySourceOfIncomeController.text = value ?? '';
                                  // Update formData
                                  widget.formData.socioEconomicData.householdPrimarySourceOfIncome = value?? '';
                                });
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

                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: TextEditingController(text: typeOfResidence?? ''),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: 'Type of residence',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down, color: maroon,),
                              itemBuilder: (BuildContext context) {
                                return [
                                  'House',
                                  'Apartment',
                                  'Condominium',
                                  'Other (specify)',
                                ].map((String option) {
                                  return PopupMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList();
                              },
                              onSelected: (String? value) {
                                setState(() {
                                  typeOfResidence = value; // Update selected value
                                  // Update text field controller
                                  typeOfResidenceController.text = value ?? '';
                                  // Update formData
                                  widget.formData.socioEconomicData.typeOfResidence = value?? '';
                                });
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

                    Container(
                      height: 40.0,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: TextEditingController(text: typeOfResidenceOwnership?? ''),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                            hintText: 'Type of residence ownership',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down, color: maroon,),
                              itemBuilder: (BuildContext context) {
                                return [
                                'Owned',
                                'Rented',
                                'Govt Housing',
                                'Other (specify)',
                                ].map((String option) {
                                  return PopupMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList();
                              },
                              onSelected: (String? value) {
                                setState(() {
                                  typeOfResidenceOwnership = value; // Update selected value
                                  // Update text field controller
                                  typeOfResidenceOwnershipController.text = value ?? '';
                                  // Update formData
                                  widget.formData.socioEconomicData.typeOfResidenceOwnership = value?? '';
                                });
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

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 500, 10),
                      height: 40,
                      //width: 2000,
                      child: Text('What are your household amenities? please select below',
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Running water'),
                            value: householdAmmenities.contains('Running water'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  householdAmmenities.add('Running water');
                                } else {
                                  householdAmmenities.remove('Running water');
                                }
                                widget.formData.socioEconomicData.householdAmmenities = householdAmmenities;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Cooling'),
                            value: householdAmmenities.contains('Cooling'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  householdAmmenities.add('Cooling');
                                } else {
                                  householdAmmenities.remove('Cooling');
                                }
                                widget.formData.socioEconomicData.householdAmmenities = householdAmmenities;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Electricity'),
                            value: householdAmmenities.contains('Electricity'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  householdAmmenities.add('Electricity');
                                } else {
                                  householdAmmenities.remove('Electricity');
                                }
                                widget.formData.socioEconomicData.householdAmmenities = householdAmmenities;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Internet/Wifi'),
                            value: householdAmmenities.contains('Internet/Wifi'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  householdAmmenities.add('Internet/Wifi');
                                } else {
                                  householdAmmenities.remove('Internet/Wifi');
                                }
                                widget.formData.socioEconomicData.householdAmmenities = householdAmmenities;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Heating Water'),
                            value: householdAmmenities.contains('Heating Water'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  householdAmmenities.add('Heating Water');
                                } else {
                                  householdAmmenities.remove('Heating Water');
                                }
                                widget.formData.socioEconomicData.householdAmmenities = householdAmmenities;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Other (Specify)'),
                            value: householdAmmenities.contains('Other (Specify)'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  householdAmmenities.add('Other (Specify)');
                                } else {
                                  householdAmmenities.remove('Other (Specify)');
                                }
                                widget.formData.socioEconomicData.householdAmmenities = householdAmmenities;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: _isSubmitting ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(200, 50),
                      ),
                      child: _isSubmitting
                          ? CircularProgressIndicator(
                        color: maroon,
                      )
                          : Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
bool _isFormDataValid(CombinedFormData formData) {
  // Check if all required fields are filled
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


 bool isSocioEconomicValid =
      formData.socioEconomicData.householdIncomeLevel?.isNotEmpty == true &&
          formData.socioEconomicData.householdAnnualIncome?.isNotEmpty == true &&
          formData.socioEconomicData.householdPrimarySourceOfIncome?.isNotEmpty ==
              true &&
          formData.socioEconomicData.typeOfResidence?.isNotEmpty == true &&
          formData.socioEconomicData.typeOfResidenceOwnership?.isNotEmpty == true;
          formData.socioEconomicData.householdAmmenities.isNotEmpty;

  return isHouseholdDetailsValid  && isSocioEconomicValid;
}




