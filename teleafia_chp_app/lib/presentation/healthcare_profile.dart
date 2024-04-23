import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HouseHoldIllnessOne extends StatefulWidget {
  const HouseHoldIllnessOne({Key? key}) : super(key: key);

  @override
  State<HouseHoldIllnessOne> createState() => _HouseHoldIllnessOneState();
}

class _HouseHoldIllnessOneState extends State<HouseHoldIllnessOne> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  Color darkMaron = Color(0XFF850808);
  int? rating;
  int? groupValue;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  int? yesNoGroupValue;
  int totalQuestions = 6;
  double progressIndicator = 0.0;
  int currentQuestion  = 0;
  void indicateProgress() {
    setState(() {
      progressIndicator = currentQuestion / totalQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:background,
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('Assets/equiafia logo.png',
                    width: 120,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text('Healthcare Profile',
                          style: TextStyle(
                            color: darkMaron,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,

                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:maroon,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child:LinearProgressIndicator(
                            value: progressIndicator,
                            valueColor: AlwaysStoppedAnimation<Color>(maroon),
                            minHeight: 5.0,
                          ),),),

                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Healthcare Access',
                        style: TextStyle(
                          color: darkMaron,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('How would you rate the accessibility of primary healthcare services in your community?'),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text('Excellent'),
                              value: 1,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                  // currentQuestion++;
                                  // indicateProgress();
                                });
                              },

                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Good'),
                              value: 2,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                  currentQuestion++;
                                  indicateProgress();
                                });
                              },

                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Fair'),
                              value: 3,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                  // currentQuestion++;
                                  //  indicateProgress();
                                });
                              },

                            ),
                          ),
                          SizedBox(
                            width: 20.0,

                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Poor'),
                              value: 4,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                  // currentQuestion++;
                                  // indicateProgress();
                                });
                              },

                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text('Have you faced any barriers in accessing primary healthcare services in the past year?')),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('YES'),
                                value: 1,
                                groupValue: yesNoGroupValue,
                                onChanged: (int? value){
                                  setState(() {
                                    yesNoGroupValue = value;
                                    rating = value;
                                    currentQuestion++;
                                    indicateProgress();
                                  }); }
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('NO'),
                                value: 2,
                                groupValue: yesNoGroupValue,
                                onChanged: (int? value){
                                  setState(() {
                                    yesNoGroupValue = value;
                                    rating = value;
                                    currentQuestion++;
                                    indicateProgress();
                                  });
                                }
                            ),
                          ),
                        ],
                      ),
                      Text('If yes, please specify the main barriers you encountered'),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                                title: Text('Geographical'),

                                value: checkBox1,
                                onChanged: (bool? value){
                                  setState(() {
                                    checkBox1 = value!;
                                    currentQuestion++;
                                    indicateProgress();
                                  });
                                }),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: Text('Financial'),

                                value: checkBox2,
                                onChanged: (bool? value){
                                  setState(() {
                                    checkBox2 = value!;
                                    currentQuestion++;
                                    indicateProgress();
                                  });
                                }),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: Text('Cultural'),
                                value: checkBox3,
                                onChanged: (bool? value){
                                  setState(() {
                                    checkBox3 = value!;
                                    currentQuestion++;
                                    indicateProgress();
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('How far do you have to travel to reach the nearest primary healthcare facility?'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 35.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Kindly select on distance range',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down),
                              //enabled: false,
                              itemBuilder: (BuildContext context){
                                return['Less than 2km', '2-10km', '10-20km', 'More than 20km', 'Not sure'].map((String option){
                                  return PopupMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList();
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Healthcare Needs and Preferences',
                        style: TextStyle(
                          color: darkMaron,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),

                      Text('What primary healthcare services do you believe are currently lacking in your community?'),
                      SizedBox(
                        height: 3.0,
                      ),
                      Container(
                        height: 35.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'List Healthcare services',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Are there any specific healthcare programs or initiatives you would like to see implemented in your community?'),
                      SizedBox(
                        height: 3.0,
                      ),
                      Container(
                        height: 35.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'List Healthcare services',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => ChildHealthStatus()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maroon,
                            minimumSize: Size(200, 50),
                          ),
                          child: Text('Next',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),),
                      ),

                    ],
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
