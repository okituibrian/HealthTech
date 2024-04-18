import 'package:flutter/material.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
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
              
              HealthClientHeader(heading: 'Book Appointment'),
              
              TextFields().generateQuestionWidget(
                'Book for',
                'Myself/Others',
                _options1,
                _selectedOption1,
                (newValue) {
                  setState(() {
                    _selectedOption1 = newValue;
                  });
                },
              ),
              TextFields().generateQuestionWidget(
                'Select  Service',
                'Medical Services',
                _medicalServices,
                _selectedservice,
                (newValue) {
                  setState(() {
                    _selectedservice = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText: 'date',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 10),
              TextFields().generateDropdownnWidget(
                'Phyical/ Virtual',
                _bookingMethod,
                _selectedMethod,
                (newValue) {
                  setState(() {
                    _selectedMethod = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Full Name',
                _fullName,
              ),
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Phone Number',
                _phoneNumber,
              ),
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
              SizedBox(height: 10),
              TextFields().GenerateTextfield(
                'Enter Age',
                _textField1,
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maroon,
                    minimumSize: Size(100, 50),
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }
}
