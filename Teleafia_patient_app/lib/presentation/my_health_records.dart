import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teleafia_patient/presentation/dashboard.dart';
import 'package:teleafia_patient/presentation/healthmonitoring.dart';
import 'package:teleafia_patient/presentation/my_appointments.dart';
import 'package:teleafia_patient/presentation/user_data_manager.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

import 'api_call_functions.dart';

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  State<MedicalRecord> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  Color darkMaron = Color(0XFF850808);
  List<String> _options1 = ['Myself', 'Others'];
  String? _selectedOption1;
  List<String> _medicalServices = [
    'Dental',
    'Physician',
    'Opthalmology and optics',
    'Physiotherapy',
    'Minor surgery',
    'Urology',
    'ENT',
    'Orthopedics',
    'Pediatrics',
  ];

  TextEditingController _textEditingController = TextEditingController();
  String? filledText;

  // TextEditingControllers for the text fields
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _textField4Controller = TextEditingController();
  final TextEditingController _textField5Controller = TextEditingController();
  final TextEditingController _textField6Controller = TextEditingController();
  final TextEditingController _textField7Controller = TextEditingController();
  final TextEditingController _textField8Controller = TextEditingController();
  final TextEditingController _textField9Controller = TextEditingController();
  final TextEditingController _textField10Controller = TextEditingController();
  final TextEditingController _textField11Controller = TextEditingController();
  final TextEditingController _textField12Controller = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _systolicController.dispose();
    _diastolicController.dispose();
    _textField4Controller.dispose();
    _textField5Controller.dispose();
    _textField6Controller.dispose();
    _textField7Controller.dispose();
    _textField8Controller.dispose();
    _textField9Controller.dispose();
    _textField10Controller.dispose();
    _textField11Controller.dispose();
    _textField12Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            HealthClientHeader(heading: 'My Health Records'),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        DashboardScreen(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                child: Container(
                                  width:
                                  120,
                                  // Adjusted width to fit 3 rectangles in a row
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF850509),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Border radius applied here
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => destination),
                                          // );
                                        },
                                        child: Image.asset(
                                          'assets/imaging.PNG',
                                          height: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Imaging Results',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: maroon,
                                          ),
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                child: Container(
                                  width:
                                  120,
                                  // Adjusted width to fit 3 rectangles in a row
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF850509),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Border radius applied here
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => destination),
                                          // );
                                        },
                                        child: Image.asset(
                                          'assets/diagnostic_test.PNG',
                                          height: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Diagnostic Test Results',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: maroon,
                                          ),
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                child: Container(
                                  width:
                                  120,
                                  // Adjusted width to fit 3 rectangles in a row
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF850509),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Border radius applied here
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => destination),
                                          // );
                                        },
                                        child: Image.asset(
                                          'assets/labresults.PNG',
                                          height: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Lab Results',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: maroon,
                                          ),
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                child: Container(
                                  width:
                                  120,
                                  // Adjusted width to fit 3 rectangles in a row
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF850509),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Border radius applied here
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => destination),
                                          // );
                                        },
                                        child: Image.asset(
                                          'assets/bloodpressure.PNG',
                                          height: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Blood Pressure',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: background,
                                                  title: Text('Blood Pressure'),
                                                  content: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                              Colors.red),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Select Date',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  true,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Systolic',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  true,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Diastolic',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        sendBP();
                                                        // Save the entered details and close the popup overlay
                                                        /*String enteredBpText =
                                                            _textEditingController
                                                                .text;*/

                                                        print(
                                                            'Entered text:');

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    MedicalRecord()));
                                                      },
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            color: maroon),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: maroon,
                                          ),
                                          child: Text(
                                            'Record',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                child: Container(
                                  width:
                                  120,
                                  // Adjusted width to fit 3 rectangles in a row
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF850509),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Border radius applied here
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => destination),
                                          // );
                                        },
                                        child: Image.asset(
                                          'assets/bmi.PNG',
                                          height: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'BMI',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: background,
                                                  title: Text('BMI Details'),
                                                  content: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                              Colors.red),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Select Date',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Weight',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Height',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Your BMI is',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        // Save the entered details and close the popup overlay
                                                        String enteredBmiText =
                                                            _textEditingController
                                                                .text;
                                                        // Save to the database
                                                        print(
                                                            'Entered text: $enteredBmiText');

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    MedicalRecord()));
                                                      },
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            color: maroon),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: maroon,
                                          ),
                                          child: Text(
                                            'Record',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                child: Container(
                                  width:
                                  120,
                                  // Adjusted width to fit 3 rectangles in a row
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF850509),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Border radius applied here
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => destination),
                                          // );
                                        },
                                        child: Image.asset(
                                          'assets/medical_document.PNG',
                                          height: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Other Related Information',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: background,
                                                  title: Text(
                                                      'General Information'),
                                                  content: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                              Colors.red),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Enter Full Names',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Enter Your Email Address',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Gender',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        //margin: EdgeInsets.all(5),
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                              Colors.red),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'Enter Age',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'List any drug related allergies',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: maroon),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              4.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30.0,
                                                              child:
                                                              TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                  enabled:
                                                                  false,
                                                                  border:
                                                                  InputBorder
                                                                      .none,
                                                                  hintText:
                                                                  'List any current medications',
                                                                ),
                                                                onSaved: (
                                                                    newValue) =>
                                                                filledText =
                                                                    newValue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        // Save the entered details and close the popup overlay
                                                        String enteredText =
                                                            _textEditingController
                                                                .text;
                                                        // Save to the database
                                                        print(
                                                            'Entered text: $enteredText');
                                                        MedicalDetailsDialog
                                                            .show(context);
                                                      },
                                                      child: Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                            color: maroon),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: maroon,
                                          ),
                                          child: Text(
                                            'Record',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: background,
                child: Center(
                  child: Text(
                    'My Health Records',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: darkMaron,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(50, 40),
                      ),
                      child: Text(
                        'View',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your action here
                        print('Button pressed!');
                      },
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                      ), // You can change the icon
                      backgroundColor: maroon, // You can change the color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }


  void sendBP() async {

    Map<String, dynamic> data = {
     'Date': _dateController.text,
     ' Systolic': _systolicController.text,
      'Diastolic': _diastolicController.text,
    };

    String jsonData = jsonEncode(data);

    String apiUrl = '${ApiServices.ngrokLink}/api/createrecord';

    print(_dateController.text);
    print(_systolicController.text);
    print(_diastolicController.text);


    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200 ) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('saved succesfully'),
              duration: Duration(seconds: 2),
            ),
          );

      } else {
        // Show an error message if the request was not successful
        print('Error: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.reasonPhrase}'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      // Show an error message if an exception occurred
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}



class MedicalDetailsDialog extends StatefulWidget {
  @override
  _MedicalDetailsDialogState createState() => _MedicalDetailsDialogState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MedicalDetailsDialog();
      },
    );
  }
}

class _MedicalDetailsDialogState extends State<MedicalDetailsDialog> {
  String filledText = ''; // This is where you can store the entered text
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          Colors.white, // Change this to your desired background color
      title: Text('Medical Related Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Full Name Input
          buildInputField('Full Name'),
          SizedBox(height: 10),
          // Email Address Input
          buildInputField('Email address'),
          SizedBox(height: 10),
          // Phone Number Input
          buildInputField('Phone Number'),
          SizedBox(height: 10),
          buildInputField('Gender'),
          SizedBox(height: 10),
          buildInputField('Age'),
          SizedBox(height: 10),
          buildInputField('Drug allergies'),
          SizedBox(height: 10),
          buildInputField('Current Medications'),
          SizedBox(height: 10),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Save the entered details and close the popup overlay
            String enteredText = _textEditingController.text;
            // Save to the database
            print('Entered text: $enteredText');

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MedicalRecord()));
          },
          child: Text(
            'Save',
            style: TextStyle(color: maroon),
          ),
        ),
      ],
    );
  }

  Widget buildInputField(String hintText) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
            child: TextFormField(
              controller: TextEditingController(text: filledText),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
              onChanged: (newValue) => filledText = newValue,
            ),
          ),
        ],
      ),
    );
  }
}
