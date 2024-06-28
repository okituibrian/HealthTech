import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teleafia_chp_app/presentation/household_illness1.dart';
import 'package:teleafia_chp_app/presentation/preventive_medicine1.dart';
import 'package:teleafia_chp_app/models.dart';
import 'household_health_profile.dart';

class Wash extends StatefulWidget {
  final CombinedFormData formData;
  const Wash({Key? key, required this.formData}) : super(key: key);

  @override
  State<Wash> createState() => _WashState();
}

class _WashState extends State<Wash> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);
  Color darkMaroon = Color(0xFF850808);

  double _progressValue = 0.4; // Set initial progress value

  String? _selectedSourceOfDrinkingWater;
  String? _selectedReliabilityOfWaterSupply;
  String? _selectedTreatingConsumptionWater;
  String? _selectedWaterTreatmentMethods;
  String? _selectedTypeOfSanitationFacility;
  String? _selectedShareOfSanitationFacility;
  String? _selectedCleaningFrequencyOfSanitationFacility;
  String? _selectedAccessibilityOfHandwashingFacility;
  String? _selectedHouseholdMembersHandwashingFrequency;
  TextEditingController sourceOfDrinkingWaterController = TextEditingController();
  TextEditingController reliabilityOfWaterSupplyController = TextEditingController();
  TextEditingController waterTreatmentMethodsController = TextEditingController();
  TextEditingController typeOfSanitationFacilityController = TextEditingController();
  TextEditingController householdMemberHandWashingFrequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: background,
        actions: [
          IconButton(
            onPressed: () {
              // onPressed logic here  will be added here
            },
            icon: Icon(
                Icons.arrow_back), // Change the icon to your desired icon
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Text(
                      'Water And Sanitation Hygiene',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: darkMaroon,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),


                  Text(
                    'water Access And Quality',
                    style: TextStyle(
                        color: darkMaroon,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text(
                        'What is your primary source of drinking water?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: maroon),)),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: sourceOfDrinkingWaterController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Please select',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down, color: maroon),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Piped water (inside dwelling)',
                                'Piped water (Outside dwelling',
                                'Tube well or borehole',
                                'Protected dug well',
                                'Unprotected dug well',
                                'Spring',
                                'Rain water',
                                'Bottled water'
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value) {
                              setState(() {
                                _selectedSourceOfDrinkingWater =
                                    value; // Update selected value
                                sourceOfDrinkingWaterController.text =
                                    value ?? ''; // Update TextField text
                                // Update formData
                                widget.formData.washData.sourceOfDrinkingWater =
                                    value ?? '';
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
                      child: Text(
                        'How would you rate the reliability of your water supply?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: maroon,),)),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: reliabilityOfWaterSupplyController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Household income level',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down, color: maroon),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Reliable (Available daily)',
                                'Somewhat available (intermittent available)',
                                'Unreliable (frequent interruptions)',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value) {
                              setState(() {
                                _selectedReliabilityOfWaterSupply =
                                    value ?? ''; // Update selected value
                                reliabilityOfWaterSupplyController.text =
                                    value ?? ''; // Update TextField text
                                widget.formData.washData
                                    .reliabilityOfWaterSupply =
                                    value ?? ''; //update formdata
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
                    'Do you treat your drinking water before consumption?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: maroon,),),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Yes',
                          groupValue: widget.formData.washData
                              .treatingConsumptionWater,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .treatingConsumptionWater =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'No',
                          groupValue: widget.formData.washData
                              .treatingConsumptionWater,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .treatingConsumptionWater =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Sometimes',
                            style: TextStyle(fontWeight: FontWeight.bold,),),
                          value: 'Sometimes',
                          groupValue: widget.formData.washData
                              .treatingConsumptionWater,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .treatingConsumptionWater =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text(
                        'If yes, please specify the method(s) of water treatment used?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: maroon),)),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: waterTreatmentMethodsController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Household income level',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down, color: maroon),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Boiling',
                                'Filtration',
                                'Sedimentation',
                                'Solar disinfection'
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value) {
                              setState(() {
                                _selectedWaterTreatmentMethods =
                                    value; // Update selected value
                                waterTreatmentMethodsController.text =
                                    value ?? ''; // Update TextField text
                                // Update formData
                                widget.formData.washData.waterTreatmentMethods =
                                    value ?? '';
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
                      color: darkMaroon,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text(
                        'What type of sanitation facility do you primarily use?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: maroon,),)),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: typeOfSanitationFacilityController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Household income level',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down, color: maroon),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Flush toilet (sewer system)',
                                'Flush toilet (septic system)',
                                'Pit latrine with slab',
                                'Pit latrine without slab',
                                'Composting toilet',
                                'Open defecation',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value) {
                              setState(() {
                                _selectedTypeOfSanitationFacility =
                                    value; // Update selected value
                                typeOfSanitationFacilityController.text =
                                    value ?? ''; // Update TextField text
                                // Update formData
                                widget.formData.washData
                                    .typeOfSanitationFacility = value ?? '';
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
                      child: Text(
                        'Is the sanitation facility shared with other households?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: maroon,),)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Yes',
                          groupValue: widget.formData.washData
                              .typeOfSanitationFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .typeOfSanitationFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'No',
                          groupValue: widget.formData.washData
                              .typeOfSanitationFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .typeOfSanitationFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),

                  Container(
                      width: 900,
                      child: Text(
                        'How often is the sanitation facility cleaned?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: maroon,),)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Daily',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Daily',
                          groupValue: widget.formData.washData
                              .cleaningFrequencyOfSanitationFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .cleaningFrequencyOfSanitationFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('weekly',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'weekly',
                          groupValue: widget.formData.washData
                              .cleaningFrequencyOfSanitationFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .cleaningFrequencyOfSanitationFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Monthly',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Monthly',
                          groupValue: widget.formData.washData
                              .cleaningFrequencyOfSanitationFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .cleaningFrequencyOfSanitationFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Rarely',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Rarely',
                          groupValue: widget.formData.washData
                              .cleaningFrequencyOfSanitationFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .cleaningFrequencyOfSanitationFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Hygiene Practices',
                    style: TextStyle(
                      color: darkMaroon,
                      fontSize: 20.0,
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                      height: 40,
                      width: 900,
                      child: Text(
                        'Do you have access to handwashing facility with soap and water?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: maroon,),)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'Yes',
                          groupValue: widget.formData.washData
                              .accessibilityOfHandWashingFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .accessibilityOfHandWashingFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          value: 'No',
                          groupValue: widget.formData.washData
                              .accessibilityOfHandWashingFacility,
                          onChanged: (String? value) {
                            setState(() {
                              widget.formData.washData
                                  .accessibilityOfHandWashingFacility =
                                  value ?? '';
                            });
                          },
                          activeColor: maroon,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),

                  Container(
                      height: 20.0,
                      width: 900,
                      child: Text(
                        'How frequently do you and your household members wash hands with soap and water?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: maroon,),)),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: householdMemberHandWashingFrequencyController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Household income level',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down, color: maroon),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Before eating',
                                'After using the toilet',
                                'After handling waste',
                                'Before and after preparing food',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value) {
                              setState(() {
                                _selectedHouseholdMembersHandwashingFrequency =
                                    value ?? ''; // Update selected value
                                householdMemberHandWashingFrequencyController
                                    .text = value ?? '';
                                widget.formData.washData
                                    .householdMemberHandWashingFrequency =
                                    value ?? '';
                                // Update TextField text
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

                  SizedBox(height: 40.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              HouseholdIllness(formData: widget.formData)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(200, 50),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
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

