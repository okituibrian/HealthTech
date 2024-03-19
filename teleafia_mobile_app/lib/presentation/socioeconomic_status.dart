import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SocioEconomic extends StatefulWidget {
  const SocioEconomic({super.key});

  @override
  State<SocioEconomic> createState() => _SocioEconomicState();
}

class _SocioEconomicState extends State<SocioEconomic> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  double _progressValue = 0.1; // Set initial progress value
  int _selectedRadio = -1;
  String? _selectedOption;
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;
  String? _selectedOption4;
  String? _selectedOption5;

  List<String> _options = [
    'Bellow Poverty Line',
    'Low Income',
    'Moderate Income',
    'High Income',
    'Prefer Not to Say',
  ];
  List<String> _options1 = [
    'ksh 10000 - ksh 20000',
    'ksh 20000 - ksh 30000',
    'ksh 30000 - ksh 40000',
    'More than  ksh 30000',
  ];
  List<String> _options2 = [
    'Employment / Salary',
    'Self-Employment / Business',
    'Govt Assistant',
    'Retirement / Pension',
  ];
  List<String> _options3 = [
    'House',
    'Apartment',
    'Condominium',
    'Other (specify)',
  ];
  List<String> _options4 = [
    'Owned',
    'Rented',
    'Govt Housing',
    'Other (specify)',
  ];
  List<String> _options5 = [
    'Household Amenities',
  ];

  bool _checkBox1 = false;
  bool _checkBox2 = false;
  bool _checkBox3 = false;
  bool _checkBox4 = false;
  bool _checkBox5 = false;
  bool _checkBox6 = false;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

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
                          'Social economic status',
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
                    DropdownButtonFormField<String>(
                      value: _selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue;
                        });
                      },
                      items: _options
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down, color: maroon),
                              SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Household Income Level',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
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
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down, color: maroon),
                              SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Household Annual Income',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
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
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down, color: maroon),
                              SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Household Primary Source Of Income',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      value: _selectedOption3,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption3 = newValue;
                        });
                      },
                      items: _options3
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down, color: maroon),
                              SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: ' Type of Residence',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      value: _selectedOption4,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption4 = newValue;
                        });
                      },
                      items: _options4
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down, color: maroon),
                              SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Type of Residence Ownership',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    DropdownButtonFormField<String>(
                      value: _selectedOption5,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption5 = newValue;
                        });
                      },
                      items: _options5
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down, color: maroon),
                              SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Household Amenities',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Running water'),
                            value: _checkBox1,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkBox1 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Cooling'),
                            value: _checkBox2,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkBox2 = value!;
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
                          child: CheckboxListTile(
                            title: Text('Electricity'),
                            value: _checkBox3,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkBox3 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Internet/Wifi'),
                            value: _checkBox4,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkBox4 = value!;
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
                          child: CheckboxListTile(
                            title: Text('Heating Water'),
                            value: _checkBox5,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkBox5 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Other (Specify)'),
                            value: _checkBox6,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkBox6 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}