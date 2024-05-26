import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teleafia_patient/presentation/payment.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';
import 'package:teleafia_patient/shared/health_client_functions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_call_functions.dart'; // For JSON encoding

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

  List<String> _medicalServices = [];
  Map<String, String> _serviceMap = {};

  @override
  void initState() {
    super.initState();
    fetchMedicalServices();
  }

  Future<void> fetchMedicalServices() async {
    var apiUrl = '${ApiServices.ngrokLink}/api/getservices';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody is List) {
          final List<dynamic> services = responseBody;
          setState(() {
            _serviceMap = {for (var item in services) item['name']: item['serviceId']};
            _medicalServices = _serviceMap.keys.toList();
          });
        } else if (responseBody is Map<String, dynamic> && responseBody.containsKey('services')) {
          final List<dynamic> services = responseBody['services'];
          setState(() {
            _serviceMap = {for (var item in services) item['name']: item['serviceId']};
            _medicalServices = _serviceMap.keys.toList();
          });
        } else {
          print('Unexpected response structure: $responseBody');
        }
      } else {
        print('Failed to fetch medical services: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching medical services: $error');
    }
  }

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
  final TextEditingController _timeController = TextEditingController();

  Color dark_maroon = const Color(0xFF850808);

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now().replacing(minute: 0);
  TimeOfDay selectedEndTime = TimeOfDay.now().replacing(minute: 0, hour: TimeOfDay.now().hour + 1);

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedStartTime,
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedStartTime = pickedTime;

          selectedEndTime = TimeOfDay(
            hour: pickedTime.hour < TimeOfDay.hoursPerPeriod - 2
                ? pickedTime.hour + 2
                : TimeOfDay.hoursPerPeriod - 2,
            minute: pickedTime.minute,
          );

          // Update the text fields directly
          _dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
          _timeController.text = pickedTime.format(context);
        });
      }
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showDialog<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _timeController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select Time',
                  prefixIcon: Icon(Icons.access_time),
                ),
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedStartTime,
                  );
                  if (pickedTime != null && pickedTime != selectedStartTime) {
                    setState(() {
                      selectedStartTime = pickedTime;
                      selectedEndTime = TimeOfDay(
                        hour: pickedTime.hour < TimeOfDay.hoursPerPeriod - 2
                            ? pickedTime.hour + 2
                            : TimeOfDay.hoursPerPeriod - 2,
                        minute: pickedTime.minute,
                      );
                      _timeController.text = pickedTime.format(context);
                    });
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedStartTime);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    if (picked != null && picked != selectedStartTime) {
      setState(() {
        selectedStartTime = picked;
        _timeController.text = formatTime(picked);
      });
    }
  }

  String formatTime(TimeOfDay time) {
    return DateFormat.jm().format(DateTime(2024, 5, 10, time.hour, time.minute));
  }

  String formatDate(DateTime date) {
    return DateFormat('E, d\'${_getDaySuffix(date.day)}\' MMM yyyy').format(date);
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  Future<void> bookAppointment() async {
    final String apiUrl = '${ApiServices.ngrokLink}/api/appointments/bookappointment';

    final Map<String, dynamic> appointmentData = {
      'bookFor': _selectedOption1,
      'service': _selectedService,
      'date': _dateController.text,
      'time': _timeController.text,
      'appointmentType': _selectedMethod,
      'idNumber': _idNumberController.text,
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
        var responseData = jsonDecode(response.body);
        var appointmentId = responseData['appointmentId'];
        print('Response Data: $responseData');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Payment(appointmentId: appointmentId, billingId: '',)),
        );
      } else {
        print('Failed to book: ${response.statusCode} => ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to book appointment')));
      }
    } catch (error) {
      print('Error booking appointment: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $error')));
    }
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
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: maroon),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 12),
                      controller: _dateController,
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            color: maroon,
                          ),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 15),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: maroon),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 12),
                      controller: _timeController,
                      decoration: InputDecoration(
                        hintText: 'Select Time',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.access_time,
                            color: maroon,
                          ),
                          onPressed: () => _selectStartTime(context),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              TextFields().GenerateTextfield(
                'Full Name',
                _fullNameController,
                    (value) {
                  _fullNameController.text = value;
                } as Function(String? p1)?,
              ),
              SizedBox(height: 15),
              TextFields().GenerateTextfield(
                'Phone Number',
                _phoneNumberController,
                    (value) {
                  _phoneNumberController.text = value;
                } as Function(String? p1)?,
              ),
              SizedBox(height: 15),
              TextFields().GenerateTextfield(
                'ID Number',
                _idNumberController,
                    (value) {
                  _idNumberController.text = value;
                } as Function(String? p1)?,
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              TextFields().GenerateTextfield(
                'Enter Age',
                _ageController,
                    (value) {
                  _ageController.text = value;
                } as Function(String? p1)?,
              ),
              SizedBox(height: 15),
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
