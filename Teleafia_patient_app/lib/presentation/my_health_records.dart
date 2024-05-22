import 'package:flutter/material.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

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
  String? _selectedservice;
  List<String> _gender1 = ['Female', 'Male'];
  List<String> _bookingMethod = ['Physical', 'Virtual'];
  String? _selectedMethod;
  String? _selectedGender;

  // TextEditingControllers for the text fields
  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController _textField2Controller = TextEditingController();
  final TextEditingController _textField3Controller = TextEditingController();
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
    _textField1Controller.dispose();
    _textField2Controller.dispose();
    _textField3Controller.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HealthClientHeader(heading: 'My Health Records'),
              TextFields().generateDropdownnWidget(
                'Gender',
                _gender1,
                _selectedGender,
                    (newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
              ),
              TextFields().GenerateTextfield(
                'Enter Age',
                _textField1Controller,
                    (value) {
                  _textField1Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Enter Full Names',
                _textField2Controller,
                    (value) {
                  _textField2Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Patient Height(cm)',
                _textField3Controller,
                    (value) {
                  _textField3Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Patient Weight (kg)',
                _textField4Controller,
                    (value) {
                  _textField4Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Patient Email Address',
                _textField5Controller,
                    (value) {
                  _textField5Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'List any drug related allergies',
                _textField6Controller,
                    (value) {
                  _textField6Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'List any medical conditions',
                _textField7Controller,
                    (value) {
                  _textField7Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'List any current medications',
                _textField8Controller,
                    (value) {
                  _textField8Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Provide details of any past surgeries',
                _textField9Controller,
                    (value) {
                  _textField9Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Provide details of any past medical history',
                _textField10Controller,
                    (value) {
                  _textField10Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Provide details of any past surgeries',
                _textField11Controller,
                    (value) {
                  _textField11Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Provide details of any past medical history',
                _textField12Controller,
                    (value) {
                  _textField12Controller.text = value!;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(80, 40),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 200),
                  Container(
                    margin: EdgeInsets.only(right: 1),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your action here
                        print('Button pressed!');
                      },
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                      backgroundColor: maroon,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }
}
