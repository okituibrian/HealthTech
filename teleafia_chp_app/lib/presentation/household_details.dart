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
  );

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
                        decoration: InputDecoration(
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
                          filled: true,
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
                      onPressed: () {
                        // Navigate to SocioEconomic screen and pass formData
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SocioEconomic(formData: formData)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(200, 50),
                      ),
                      child: Text(
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
}
