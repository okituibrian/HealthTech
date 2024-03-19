import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wash extends StatefulWidget {
  const Wash({super.key});

  @override
  State<Wash> createState() => _WashState();
}

class _WashState extends State<Wash> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  double _progressValue = 0.4; // Set initial progress value
  String? _selectedOption;
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;
  String? _selectedOption4;
  String? _selectedOption5;
  String? _selectedOption6;



  List<String> _options1 = [
    'Bellow Poverty Line',
    'Low Income',
    'Moderate Income',
    'High Income',
    'Prefer Not to Say',
  ];
  List<String> _options2 = [
    'Piped water (inside dwelling)',
    'Piped water (outside dwelling)',
    'Tube well or Borehole',
    'Protected dug well', // Unique value
    'Unprotected dug well',
    'Spring',
    'Rain Water',
    'Bottled water',
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
      appBar: AppBar(
        backgroundColor: background,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  // onPressed logic here  will be added here
                },
                icon: Icon(Icons.arrow_back), // Change the icon to your desired icon
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
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
                        'Water And Sanitation Hygiene',
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
                    'water Access And Quality',
                    style: TextStyle(
                      color: maroon,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text('What is your primary source of drinking water?'),
                  SizedBox(
                    height: 40.0,
                    child: DropdownButton<String>(
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
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text('How would you rate the reliability of your water?'),
                  SizedBox(
                    height: 40.0,
                    child: DropdownButton<String>(
                      value: _selectedOption2,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption2 = newValue;
                        });
                      },
                      items: _options2
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text('Do you treat your water before consumption?'),

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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('If yes please specify the method(s) of water treatment used'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'List them here',
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text(
                    'Sanitation Facilities',
                    style: TextStyle(
                      color: maroon,
                      fontSize: 30.0,
                    ),
                  ),

                  SizedBox(height: 10.0),
                  Text('What type of sanitation do you primarily use?'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'List the types here',
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text('Is the sanitation facility used by other households?'),
                  Row(
                    children: [
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('How often is the sanitation facility cleaned?'),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Daily'),
                          value: 'Daily',
                          groupValue: _selectedOption5,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption5 = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Weekly'),
                          value: 'Weekly',
                          groupValue: _selectedOption5,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption5 = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Monthly'),
                          value: 'Monthly',
                          groupValue: _selectedOption5,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption5 = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Rarely'),
                          value: 'Rarely',
                          groupValue: _selectedOption5,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption5 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  Text(
                    'Hygiene Practices',
                    style: TextStyle(
                      color: maroon,
                      fontSize: 30.0,
                    ),
                  ),
                  Text('Do you have access to handwashing facility with soap and water?'),
                  Row(
                    children: [
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('How frequently do you and your family wash your hands with water and soap?'),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Outline here',
                    ),
                  ),
                  SizedBox(height: 10.0),

                  SizedBox(height: 10.0),

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
    );
  }
}