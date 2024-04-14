import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/presentation/household_illness1.dart';

class Wash extends StatefulWidget {
  const Wash({super.key});

  @override
  State<Wash> createState() => _WashState();
}

class _WashState extends State<Wash> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  double _progressValue = 0.4; // Set initial progress value

  String? _selectedsourceOfDrinkingWater;
  String? _selectedreliabilityOfWaterSupply;
  String? _selectedtreatingConsumptionWater;
  String? _selectedwaterTreatmentMethods;
  String? _selectedtypeOfSanitationFacility;
  String? _selectedshareOfSanitationFacility;
  String? _selectedcleaningFrequencyOfSanitationFacility;
  String? _selectedaccessibilityOfHandwashingFacility;
  String? _selectedhouseholdMembersHandwashingFrequency;








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

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text('What is your primary source of drinking water?')) ,
                  Container(
                    height: 40.0,
                    child: TextField(
                      controller: TextEditingController(text: _selectedsourceOfDrinkingWater ?? ''),
                      decoration: InputDecoration(
                          hintText: 'Outline the source(s)',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Piped water (inside dwelling)',
                                'Piped water (outside dwelling)',
                                'Tube well or Borehole',
                                'Protected dug well',
                                'Unprotected dug well',
                                'Spring',
                                'Rain Water',
                                'Bottled water',
                                'Other (specify)',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedsourceOfDrinkingWater = value;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text('How would you rate the reliability of your water supply?')) ,
                  Container(
                    height: 40.0,
                    child: TextField(
                      controller: TextEditingController(text: _selectedreliabilityOfWaterSupply ?? ''),
                      decoration: InputDecoration(
                          hintText: 'Outline the here',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Reliable (available daily)',
                                'Somewhat available (intermittent available)',
                                'Unreliable (frequent interruptions)',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedreliabilityOfWaterSupply = value;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),
                  Text('Do you treat your drinking water before consumption?'),
                  Container(
                    height: 40,
                    width: 900,
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedtreatingConsumptionWater,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedtreatingConsumptionWater = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedtreatingConsumptionWater,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedtreatingConsumptionWater = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Sometimes'),
                            value: 'Sometimes',
                            groupValue: _selectedtreatingConsumptionWater,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedtreatingConsumptionWater = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0) ,

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text('If yes, please specify the method(s) of water treatment used?')) ,
                  Container(
                    height: 40.0,
                    child: TextField(
                      controller: TextEditingController(text: _selectedwaterTreatmentMethods ?? ''),
                      decoration: InputDecoration(
                          hintText: 'Select here',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Boiling',
                                'Filtration',
                                'Sedimentation',
                                'Solar disinfection',

                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedwaterTreatmentMethods = value;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
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
                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text('What type of sanitation facility do you primarily use?')) ,
                  Container(
                    height: 40.0,
                    child: TextField(
                      controller: TextEditingController(text: _selectedtypeOfSanitationFacility ?? ''),
                      decoration: InputDecoration(
                          hintText: 'List the type of sanitation facility used',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Flush toilet(sewer system)',
                                'Flush toilet(septic tank)',
                                'Pit latrine with slab',
                                'Pit latrine without slab',
                                'Composting toilet',
                                'Open defecation',
                                'Other(specify)',

                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedtypeOfSanitationFacility = value;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),


                  SizedBox(height: 10.0),

                  Container(
                      height: 40,
                      width: 900,
                      child: Text('Is the sanitation facility shared with other households?')),
                  Container(
                    height: 40,
                    width: 900,
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedshareOfSanitationFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedshareOfSanitationFacility = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedshareOfSanitationFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedshareOfSanitationFacility = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Container(

                      width: 900,
                      child: Text('How often is the sanitation facility cleaned?')),
                  Container(
                    //height: 40,
                    width: 900,
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Daily'),
                            value: 'Daily',
                            groupValue: _selectedcleaningFrequencyOfSanitationFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedcleaningFrequencyOfSanitationFacility = value;

                              }

                              );

                            },
                            activeColor: maroon,

                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Weekly'),
                            value: 'Weekly',
                            groupValue: _selectedcleaningFrequencyOfSanitationFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedcleaningFrequencyOfSanitationFacility = value;
                              });
                            },
                            activeColor: maroon,

                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Monthly'),
                            value: 'Monthly',
                            groupValue: _selectedcleaningFrequencyOfSanitationFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedcleaningFrequencyOfSanitationFacility = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Rarely'),
                            value: 'Rarely',
                            groupValue: _selectedcleaningFrequencyOfSanitationFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedcleaningFrequencyOfSanitationFacility = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Hygiene Practices',
                    style: TextStyle(
                      color: maroon,
                      fontSize: 30.0,
                    ),
                  ),

                  SizedBox(height: 20) ,

                  Container(
                      height: 40,
                      width: 900,
                      child: Text('Do you have access to handwashing facility with soap and water?')),
                  Container(
                    height: 40,
                    width: 900,
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('Yes'),
                            value: 'Yes',
                            groupValue: _selectedaccessibilityOfHandwashingFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedaccessibilityOfHandwashingFacility = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text('No'),
                            value: 'No',
                            groupValue: _selectedaccessibilityOfHandwashingFacility,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedaccessibilityOfHandwashingFacility = value;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text('How frequently do you and your household members wash hands with soap and water?')) ,
                  Container(
                    height: 40.0,
                    child: TextField(
                      controller: TextEditingController(text: _selectedhouseholdMembersHandwashingFrequency ?? ''),
                      decoration: InputDecoration(
                          hintText: 'Outline here',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Before eating',
                                'After using the toilet',
                                'After handling waste',
                                'Before and after preparing food',
                                'Other (specify)',

                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedhouseholdMembersHandwashingFrequency = value;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maroon),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HouseHoldIllness1()));
                    },
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