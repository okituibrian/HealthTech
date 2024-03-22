import 'package:flutter/material.dart';

class MemberDetails extends StatefulWidget {
  const MemberDetails({super.key});
  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}
class _MemberDetailsState extends State<MemberDetails> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);
  int? rating;
  String? groupValue;
  String? groupValue1;
  String? groupValue2;
  String? groupValue3;
  String? groupValue4;
  String? groupValue5;
  String? selectedAge;
  String? selectedGender;
  String? selectedEthnicity;
  String? selectedEducation;
  String? selectedEmployed;
  String? selectedInsurance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // backgroundColor: background,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width *1,
                height: MediaQuery.of(context).size.height *1,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/Afialogo.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        child:
                        Text('Member Details ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: darkmaroon,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: maroon,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: LinearProgressIndicator(
                            value: 0.5,
                            valueColor: AlwaysStoppedAnimation<Color>(maroon),
                            minHeight: 12.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: ' Household Number',
                            contentPadding: EdgeInsets.all(5.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: maroon),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: maroon),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        height: 25,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: TextEditingController(text: selectedAge ?? ''),
                          decoration: InputDecoration(
                              hintText: 'Age',
                              contentPadding: EdgeInsets.all(4.0),
                              suffixIcon: PopupMenuButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'Under 18',
                                    '18-24',
                                    '25-34',
                                    '35-44',
                                    '45-54',
                                    '55-64',
                                    '65 or older'
                                  ].map((String option) {
                                    return PopupMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                                onSelected: (String? value){
                                  setState(() {
                                    selectedAge = value;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: maroon),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: maroon ),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        height: 25,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: TextEditingController(text: selectedGender ?? ''),
                          decoration: InputDecoration(
                              hintText: 'Gender',
                              contentPadding: EdgeInsets.all(4.0),
                              suffixIcon: PopupMenuButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'Male',
                                    'Female'
                                  ].map((String option) {
                                    return PopupMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                                onSelected: (String? value){
                                  setState(() {
                                    selectedGender = value;
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
                      SizedBox(height: 5.0,),
                      Container(
                        height: 25,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: TextEditingController(text: selectedEthnicity ?? ''),
                          decoration: InputDecoration(
                              hintText: 'Ethnicity/Race',
                              contentPadding: EdgeInsets.all(4.0),
                              suffixIcon: PopupMenuButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'African',
                                    'White',
                                    'Indian'
                                  ].map((String option) {
                                    return PopupMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                                onSelected: (String? value){
                                  setState(() {
                                    selectedEthnicity = value;
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
                      SizedBox(height: 5.0,),
                      Container(
                        height: 25,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: TextEditingController(text: selectedEducation ?? ''),
                          decoration: InputDecoration(
                              hintText: 'Highest Educational Level',
                              contentPadding: EdgeInsets.all(4.0),
                              suffixIcon: PopupMenuButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'University',
                                    'College/Technical Institute',
                                    'Secondary',
                                    'Primary',
                                    'No Formal Education'
                                  ].map((String option) {
                                    return PopupMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                                onSelected: (String? value){
                                  setState(() {
                                    selectedEducation = value;
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
                      SizedBox(height: 5.0,),
                      Container(
                        height: 25,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: TextEditingController(text: selectedEmployed ?? ''),
                          decoration: InputDecoration(
                              hintText: 'Are you currently employed',
                              contentPadding: EdgeInsets.all(4.0),
                              suffixIcon: PopupMenuButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'Retired',
                                    'Yes, full time',
                                    'Yes, part time',
                                    'No, unemployed',
                                    'Student',
                                  ].map((String option) {
                                    return PopupMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                                onSelected: (String? value){
                                  setState(() {
                                    selectedEmployed = value;
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
                      SizedBox(height: 5.0,),
                      Container(
                        height: 25,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: TextEditingController(text: selectedInsurance ?? ''),
                          decoration: InputDecoration(
                              hintText: 'Do you have medical insurance cover',
                              contentPadding: EdgeInsets.all(4.0),
                              suffixIcon: PopupMenuButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'Yes',
                                    'No'
                                  ].map((String option) {
                                    return PopupMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                                onSelected: (String? value){
                                  setState(() {
                                    selectedInsurance = value;
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
                      SizedBox(height:5.0,),
                      Column(
                          children: [
                            Row(
                              children: [
                                Text('Heathcare Quality',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: darkmaroon,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('How satisfied are you with the quality of primary'
                                    ' healthcare services in your community?',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                      title: Text('very dissatisfied'),
                                      value: 'very dissatisfied',
                                      groupValue: groupValue,
                                      activeColor: maroon,
                                      onChanged: (String? value){
                                        setState(() {
                                          groupValue = value;
                                          rating = value == 'very dissatisfied' ? 1 : 0;
                                        });
                                      }
                                  ),
                                ),
                                SizedBox(width: 5.0,),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                      title: Text('dissatisfied'),
                                      value: 'dissatisfied',
                                      groupValue: groupValue,
                                      activeColor: maroon,
                                      onChanged: (String? value){
                                        setState(() {
                                          groupValue = value;
                                          rating = value == 'dissatisfied' ? 1 : 0;
                                        });
                                      }
                                  ),
                                ),
                                SizedBox(width: 5.0,),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                      title: Text('neutral'),
                                      value: 'neutral',
                                      groupValue: groupValue,
                                      activeColor: maroon,
                                      onChanged: (String? value){
                                        setState(() {
                                          groupValue = value;
                                          rating = value == 'neutral' ? 1 : 0;
                                        });
                                      }
                                  ),
                                ),
                                SizedBox(width: 5.0,),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                      title: Text('satisfied'),
                                      value: 'satisfied',
                                      groupValue: groupValue,
                                      activeColor: maroon,
                                      onChanged: (String? value){
                                        setState(() {
                                          groupValue = value;
                                          rating = value == 'satisfied' ? 1 : 0;
                                        });
                                      }
                                  ),
                                ),
                                SizedBox(width: 5.0,),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                      title: Text('very satisfied'),
                                      value: 'very satisfied',
                                      groupValue: groupValue,
                                      activeColor: maroon,
                                      onChanged: (String? value){
                                        setState(() {
                                          groupValue = value;
                                          rating = value == 'very satisfied' ? 1 : 0;
                                        });
                                      }
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Text('Have you experienced any issue with the quality of primary'
                                    ' healthcare in your community?If yes, please describe.',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Container(
                              height: 30.0,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    hintText: 'Highlight the issues faced',
                                    contentPadding: EdgeInsets.all(10.0),
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
                            SizedBox(height: 5.0,),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: TextButton(onPressed: (){},
                                style: TextButton.styleFrom(backgroundColor: maroon,
                                  minimumSize: Size(500, 40),
                                ),
                                child: Text('Next',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),),),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
