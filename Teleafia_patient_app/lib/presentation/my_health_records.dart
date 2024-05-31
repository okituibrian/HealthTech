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
  String? _textField1;
  String? _textField2;
  String? _textField3;
  bool _isVisible = true;

  String? filledText;

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
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
                        ),
                        Text(
                          'General Information',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Enter Full Names',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Enter Your Email Address',
                          _textField2,
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
                        TextFields().GenerateHealthRecordTextfield(
                          'Enter Age',
                          _textField1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Enter Your Height(cm)',
                          _textField3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Enter Your Weight (kg)',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'BMI results',
                                  ),
                                  onSaved: (newValue) => filledText = newValue,
                                ),
                              ),
                            ),
                            SizedBox(width: 150),
                            Container(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: maroon,
                                  minimumSize: Size(50, 40),
                                ),
                                child: Text(
                                  'BMI',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
                        ),
                        Text(
                          'Medical Related Information',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'List any drug related allergies',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'List any medical conditions',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'List any current medications',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Provide details of any past surgeries',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Provide details of any past medical history',
                          _textField2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFields().GenerateHealthRecordTextfield(
                          'Provide details of any past surgeries',
                          _textField2,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
                        ),
                        Text(
                          'Medical Related Documents',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Upload LabTest results...',
                                  ),
                                  onSaved: (newValue) => filledText = newValue,
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Container(
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: maroon,
                                  minimumSize: Size(50, 40),
                                ),
                                child: Text(
                                  'LabTest Results',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Upload Imaging results...',
                                  ),
                                  onSaved: (newValue) => filledText = newValue,
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Container(
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: maroon,
                                  minimumSize: Size(50, 40),
                                ),
                                child: Text(
                                  'Imaging Results',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Upload Diagnostic Test results',
                                  ),
                                  onSaved: (newValue) => filledText = newValue,
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Container(
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: maroon,
                                  minimumSize: Size(50, 40),
                                ),
                                child: Center(
                                  child: Text(
                                    'Diagnostic Test Results',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                          height: 10,
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
                        'Save',
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
}
