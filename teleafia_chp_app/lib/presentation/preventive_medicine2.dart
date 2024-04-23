/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teleafia_mobile_app/models.dart';
import 'package:teleafia_mobile_app/presentation/chp_lastscreen.dart';
import 'dart:convert';

class PreventiveMedicineTwo extends StatefulWidget {
  final CombinedFormData formData;

  const PreventiveMedicineTwo({Key? key, required this.formData}) : super(key: key);

  @override
  State<PreventiveMedicineTwo> createState() => _PreventiveMedicineTwoState();
}

class _PreventiveMedicineTwoState extends State<PreventiveMedicineTwo> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  Color darkMaroon = Color(0XFF850808);
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'Assets/logo.png',
                    width: 120,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.0),
                Center(
                  child: Text(
                    'Preventive Medicine',
                    style: TextStyle(
                      color: darkMaroon,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: maroon),
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
                Text('Immunizations and Preventive Screenings',
                  style: TextStyle(
                    color: darkMaroon,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text('Are you up to date with your routine immunizations(e.g., flu vaccine, tetanus shot)?'),
                */
/*SizedBox(
                  height: 5.0,
                ),*//*

               */
/* Row(
                  children: [
                    Expanded(
                      child:  RadioListTile<String>(
                        title: Text('Yes'),
                        value: 'Yes',
                        groupValue: widget.formData.preventiveMedicine2Data.routineImmunizationUpToDate,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.routineImmunizationUpToDate = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child:  RadioListTile<String>(
                        title: Text('No'),
                        value: 'No',
                        groupValue: widget.formData.preventiveMedicine2Data.routineImmunizationUpToDate,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.routineImmunizationUpToDate = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child:RadioListTile<String>(
                        title: Text('Sometimes'),
                        value: 'Sometimes',
                        groupValue: widget.formData.preventiveMedicine2Data.routineImmunizationUpToDate,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.routineImmunizationUpToDate = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Text('When was your last medical check-up or preventive screening(e.g., blood pressure, cholesterol)?'),
                SizedBox(height: 15.0,),
                Container(
                  height: 40.0,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        widget.formData.preventiveMedicine2Data.lastMedicalCheckupHistory = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Outline the factors',
                      suffixIcon: PopupMenuButton<String>(
                        icon: Icon(Icons.arrow_drop_down,
                          color: maroon,
                        ),
                        color: background,
                        //enabled: false,
                        itemBuilder: (BuildContext context){
                          return['Within the past year', '1-2 years ago', 'More than 2 years ago', 'never'].map((String option){
                            return PopupMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList();
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: maroon, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: maroon, width: 1.0,),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                Text('Have you undergone any cancer screenings(e.g., mammogram, colonoscopy) as recommended for your age and gender?'),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RadioListTile<String>(
                        title: Text('Yes'),
                        value: 'Yes',
                        groupValue: widget.formData.preventiveMedicine2Data.cancerScreening,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.cancerScreening = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<String>(
                        title: Text('No'),
                        value: 'No',
                        groupValue: widget.formData.preventiveMedicine2Data.cancerScreening,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.cancerScreening = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<String>(
                        title: Text('Not sure'),
                        value: 'Not sure',
                        groupValue: widget.formData.preventiveMedicine2Data.cancerScreening,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.cancerScreening = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                  ],
                ),

                Text('Health Information and Awareness',
                  style: TextStyle(
                    color: darkMaroon,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,

                  ),),
                SizedBox(
                  height: 20.0,
                ),
                Text('How do you stay informed about preventive health measures?'),
                Container(
                  height: 40.0,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        widget.formData.preventiveMedicine2Data.healthInformationAndAwareness = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Kindly select an option',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: maroon, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: maroon, width: 1.0,),

                      ),
                    ),

                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Have you received education or counseling on preventive health measures from a healthcare provider in the past year?'),),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<String>(
                        title: Text('Yes'),
                        value: 'Yes',
                        groupValue: widget.formData.preventiveMedicine2Data.recievedEducationOrCounselingHealthMeasures,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.recievedEducationOrCounselingHealthMeasures = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<String>(
                        title: Text('No'),
                        value: 'No',
                        groupValue: widget.formData.preventiveMedicine2Data.recievedEducationOrCounselingHealthMeasures,
                        onChanged: (String? value) {
                          setState(() {
                            widget.formData.preventiveMedicine2Data.recievedEducationOrCounselingHealthMeasures = value?? '';
                          });
                        },
                        activeColor: maroon,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Add your other UI components here
                // ...
                Center(
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : handleSubmit,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit() {
    setState(() {
      _isSubmitting = true; // Set state to indicate submission in progress
    });
    sendFormDataToBackend(widget.formData);
  }

   // Add this import for jsonEncode

  void sendFormDataToBackend(CombinedFormData formData) {
    final url = Uri.parse('https://fc5d-102-210-244-74.ngrok-free.app/api/create/household');

    final jsonData = {
      'HouseholdDetailsFormData': formData.householdDetailsData.toJson(),
      'SocioEconomicFormData': formData.socioEconomicData.toJson(),
      'HouseholdIllnessFormData': formData.householdIllnessData.toJson(),
      'WashFormData': formData.washData.toJson(),
      'PreventiveMedicine1FormData': formData.preventiveMedicine1Data.toJson(),
      'PreventiveMedicine2FormData': formData.preventiveMedicine2Data.toJson(),
     // 'ChildHealthStatusFormData': formData.childHealthStatusData.toJson(),
      'HouseholdHealthProfileFormData': formData.householdHealthProfileData.toJson(),
    };

    final jsonEncodedData = jsonEncode(jsonData); // Convert to JSON format

    http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Specify content type as JSON
      },
      body: jsonEncodedData,
    ).then((response) {
      if (response.statusCode == 200) {
        print('Data submitted successfully');
        // Navigate to the next screen upon successful submission
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LastScreen()),
        );
      } else {
        print('Failed to submit data. Status code: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error occurred: $error');
    });
  }

}*/

