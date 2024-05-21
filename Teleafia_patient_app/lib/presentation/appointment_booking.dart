import 'package:flutter/material.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  final Color darkMaron = Color(0XFF850808);
  final List<String> _options1 = ['myself', 'others'];
  String? _selectedOption1;
  final List<String> _medicalServices = [
    'Dentist',
    'Physician',
    'Ophthalmology and optics',
    'Physiotherapy',
    'Minor surgery',
    'Urology',
    'ENT',
    'Orthopedics',
    'Pediatrics',
  ];
  String? _selectedService;
  final List<String> _gender1 = ['female', 'male'];
  final List<String> _bookingMethod = ['physical', 'virtual'];
  String? _selectedMethod;
  String? _selectedGender;

  // TextEditingControllers for the text fields
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Function to send the data to the backend API
  Future<void> bookAppointment() async {
    final String apiUrl = 'https://54c6-102-210-244-74.ngrok-free.app/api/appointments/bookappointment';

    final Map<String, dynamic> appointmentData = {
      'bookFor': _selectedOption1,
      'service': _selectedService,
      'date': _dateController.text,
      'appointmentType': _selectedMethod,
      'idNumber': 321456789,
      'fullName': _fullNameController.text,
      'phoneNumber': _phoneNumberController.text,
      'age': 23,
      'gender': _selectedGender,
    };
    print('Posting data: ${json.encode(appointmentData)}');
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(appointmentData),
      );

      if (response.statusCode == 201) {
        print('Success: ${response.statusCode} =>  ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Appointment booked successfully')));
      } else {
        print('Failed to post: ${response.statusCode} => ${response.body} ');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to book appointment')));
      }
    } catch (error) {
      print('Error fetching profile image: $error');
      // Show an error message if there is an exception
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $error')));
    }
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _dateController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _idNumberController.dispose();
    _ageController.dispose();
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
                'Select Service',
                'Medical Services',
                _medicalServices,
                _selectedService,
                    (newValue) {
                  setState(() {
                    _selectedService = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        hintText: 'Date',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFields().generateDropdownnWidget(
                'Physical/ Virtual',
                _bookingMethod,
                _selectedMethod,
                    (newValue) {
                  setState(() {
                    _selectedMethod = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFields().generateTextField(
                'Full Name',
                _fullNameController,
                    (value) {
                  _fullNameController.text = value;
                },
              ),
              SizedBox(height: 10),
              TextFields().generateTextField(
                'Phone Number',
                _phoneNumberController,
                    (value) {
                  _phoneNumberController.text = value;
                },
              ),
              SizedBox(height: 10),
              TextFields().generateTextField(
                'ID Number',
                _idNumberController,
                    (value) {
                  _idNumberController.text = value;
                },
              ),
              SizedBox(height: 10),
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
              TextFields().generateTextField(
                'Enter Age',
                _ageController,
                    (value) {
                  _ageController.text = value;
                },
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: bookAppointment,
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

// Assuming you have a TextFields class somewhere that generates the widgets
class TextFields {
  Widget generateQuestionWidget(String label, String hintText, List<String> options, String? selectedOption, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedOption,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      items: options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget generateDropdownnWidget(String label, List<String> options, String? selectedOption, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedOption,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget generateTextField(String label, TextEditingController controller, Function(String) onChanged) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
