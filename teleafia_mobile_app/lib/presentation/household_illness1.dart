import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HouseHoldIllness1 extends StatefulWidget {
  const HouseHoldIllness1({super.key});

  @override
  State<HouseHoldIllness1> createState() => _HouseHoldIllness1State();
}

class _HouseHoldIllness1State extends State<HouseHoldIllness1> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  double _progressValue = 0.4; // Set initial progress value
  String? _selectedOption1;
  List<String> _selectedOptions = []; // List to store selected options
  String? _selectedOption3;
  String? _selectedOption4;
  String? _selectedOption5;
  String? _selectedOption6;

  List<String> _options1 = [
    'None',
    '1-2 Members',
    '2-3 Members',
    '3-4 Members',
    '5 or more Members',
  ];
  List<String> _options2 = [
    'Respiratory infections',
    'Gastrointestinal Infections',
    'Skin Infections',
    'Chronic Conditi ons',
    'Mental Health conditions',
    'Other (specify)',
  ];
  List<String> _options3 = [
    'Reliable (available daily)',
    'Somewhat available (intermittent available)',
    'Unreliable (frequent interruptions)',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
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
                          'Household Illness',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: maroon,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        LinearProgressIndicator(
                          value: _progressValue,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(maroon),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Household Illness',
                      style: TextStyle(
                        color: maroon,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        'In the past months how many members of your house have experienced illness symptoms (E.g cough, fever and diarrhea)?'),
                    SizedBox(
                      height: 40.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: maroon), // Add border styling
                        ),
                        child: DropdownButton<String>(
                          hint: Text('Kindly select'),
                          value: _selectedOption1,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption1 = newValue;
                            });
                          },
                          items: _options1
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: maroon),
                              ),
                            );
                          }).toList(),
                          style: TextStyle(color: maroon),
                          dropdownColor: background,
                          icon: Icon(Icons.arrow_drop_down, color: maroon), // Change the dropdown icon here
                          elevation: 2,
                          underline: SizedBox(), // Remove the underline
                          isExpanded: true,
                          iconSize: 30.0,
                        ),
                      ),
                    ),


                    SizedBox(height: 10.0),

                    Text('What type of illness has affected your household members over the past months?'),
                    SizedBox(
                      height: 40.0,
                      child: DropdownButtonFormField<String>(
                        hint: Text('Enlist the types of illness'),
                        value: null,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) {
                              if (_selectedOptions.contains(newValue)) {
                                _selectedOptions.remove(newValue);
                              } else {
                                _selectedOptions.add(newValue); // Fixed here
                              }
                            }
                          });
                        },
                        items: _options2
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _selectedOptions.contains(value),
                                  onChanged: (_) {
                                    setState(() {
                                      if (_selectedOptions.contains(value)) {
                                        _selectedOptions.remove(value);
                                      } else {
                                        _selectedOptions.add(value);
                                      }
                                    });
                                  },
                                  // Change the color of the checkbox tick here
                                  activeColor: maroon,
                                ),
                                Text(
                                  value,
                                  style: TextStyle(color: maroon),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        style: TextStyle(color: maroon),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                          ),
                        ),
                        dropdownColor: background,
                        icon: Icon(Icons.menu, color: maroon), // Change the dropdown icon here
                        elevation: 2,
                        isExpanded: true,
                        iconSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('Did any household member require treatment for their illness?'),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedOption3,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption3 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedOption3,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption3 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Sometimes'),
                            value: 'Sometimes',
                            groupValue: _selectedOption3,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption3 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text('If yes, please indicate the type of treatment sought'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Outline the kind of medication treatment',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                            child: Text('Is any household member currently sick?')),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedOption4,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption4 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedOption4,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption4 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                            child: Text('If YES has he/she sought medical attention?')),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedOption5,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption5 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedOption5,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption5 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('If NO, is he/she ready to be referred to the nearby medical facility?')),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedOption6,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption6 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedOption6,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption6 = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text('If YES kindly proceed to fill the medical form?'),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: background,
                            ),
                            child: Text(
                              'MEDICAL REPORTING FORM',
                              style: TextStyle(
                                color: maroon,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                      ),
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
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

