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
    'physiotherapy',
    'Minor surgery',
    'Urology',
    'ENT',
    'Orthopedics',
    'Pediatrics',
  ];
  String? _selectedservice;
  List<String> _gender1 = [
    'Female',
    'Male',
  ];
  List<String> _bookingMethod = [
    'Physical',
    'Virtual',
  ];
  String? _selectedMethod;

  String? _selectedGender;
  String? _textField1;
  String? _textField2;
  String? _textField3;
  String? _textField4;
  String? _textField5;
  String? _phoneNumber;
  String? _fullName;

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
                _textField1,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Enter Full Names',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Patient Height(cm)',
                _textField3,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Patient Weight (kg)',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Patient Email Address',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'List any drug related allergies',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'List any medical conditions',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'List any current medications',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Provide details of any past surgeries',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Provide details of any past medical history',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields().GenerateTextfield(
                'Provide details of any past surgeries',
                _textField2,
              ),
              SizedBox(
                height: 10,
              ),
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
                  SizedBox(
                    width: 200,
                  ),
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
                      ), // You can change the icon
                      backgroundColor: maroon, // You can change the color
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
