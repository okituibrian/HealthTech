import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teleafia_chp_app/presentation/socioeconomic_status.dart';
import 'package:teleafia_chp_app/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HouseHoldDetails extends StatefulWidget {

  HouseHoldDetails({Key? key}) : super(key: key);

  @override
  State<HouseHoldDetails> createState() => _HouseHoldDetailsState();
}

class _HouseHoldDetailsState extends State<HouseHoldDetails> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);
  double _progressValue = 0.1;
  bool _isSubmitting = false;
  // Set initial progress value
  CombinedFormData formData = CombinedFormData(
    householdDetailsData: HouseholdDetailsFormData(),
    socioEconomicData: SocioEconomicFormData(),
   /* householdIllnessData: HouseholdIllnessFormData(),
    washData: WashFormData(),
    preventiveMedicine1Data: PreventiveMedicine1FormData(),
    preventiveMedicine2Data: PreventiveMedicine2FormData(),
   // childHealthStatusData: ChildHealthStatusFormData(),
    householdHealthProfileData: HouseholdHealthProfileFormData(),*/
  );
  Future<void> _submitForm() async {
    // Validate form data
    if (_isFormDataValid(formData)) {
      // Convert form data to JSON string
      String jsonData = jsonEncode(formData.toJson());
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
      if (response.statusCode == 200) {
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
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,

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
                          'Household Details',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: maroon,
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Household Number',
                          labelText: 'Household Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.householdNumber = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Nationality',
                          labelText: 'Nationality',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.nationality = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'County',
                          labelText: 'County',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.county = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'SubCounty',
                          labelText: 'SubCounty',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.subCounty = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: Colors.white,
                          hintText: 'Constituency',
                          labelText: 'Constituency',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.constituency = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Ward',
                          labelText: 'Ward',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.ward = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Community Unit',
                          labelText: 'Community Unit',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.communityUnit = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Household size',
                          labelText: 'Household Size',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.householdSize = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Number of children under 5years',
                          labelText: 'Number of children under 5years',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: maroon, width: 1.0,),

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            formData.householdDetailsData.numberOfUnderFive = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SocioEconomic(formData: formData)),);},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(200, 50),
                      ),
                      child: _isSubmitting
                          ? CircularProgressIndicator(
                        color: maroon,
                      )
                          : Text(
                        'Next',
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

  // Helper method to validate form data
  bool _isFormDataValid(CombinedFormData formData) {
    // Check if all required fields are filled
    return formData.householdDetailsData.householdNumber?.isNotEmpty == true &&
        formData.householdDetailsData.nationality?.isNotEmpty == true &&
        formData.householdDetailsData.county?.isNotEmpty == true &&
        formData.householdDetailsData.subCounty?.isNotEmpty == true &&
        formData.householdDetailsData.constituency?.isNotEmpty == true &&
        formData.householdDetailsData.ward?.isNotEmpty == true &&
        formData.householdDetailsData.communityUnit?.isNotEmpty == true &&
        formData.householdDetailsData.householdSize?.isNotEmpty == true &&
        formData.householdDetailsData.numberOfUnderFive?.isNotEmpty == true;
  }
}
