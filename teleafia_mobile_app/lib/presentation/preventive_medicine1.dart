import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:teleafia_mobile_app//preventive_medicine2.dart';

class PreventiveMedicineOne extends StatefulWidget {
  const PreventiveMedicineOne({super.key});

  @override
  State<PreventiveMedicineOne> createState() => _PreventiveMedicineOneState();
}

class _PreventiveMedicineOneState extends State<PreventiveMedicineOne> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  Color darkMaron = Color(0XFF850808);
  int? rating;
  int? groupValue;
  int? groupValue1;
  int? groupValue2;
  int? groupValue3;
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
                        child: Text('Preventive Medicine',
                          style: TextStyle(
                            color: darkMaron,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,

                          ),

                        ),
                      ),
                      SizedBox(
                        height: 15.0,
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
                            value: 0.5,
                            valueColor: AlwaysStoppedAnimation<Color>(maroon),
                            minHeight: 10.0,
                          ),),),

                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Health Behaviors and Lifestyle'),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('How frequently do you engage in preventive healthcare activities (e.g., regular check-ups, vaccinations, sccreenings)?'),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text('Regular'),
                              value: 1,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                });
                              },

                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Occassionaly'),
                              value: 2,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                });
                              },

                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Rarely'),
                              value: 3,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                });
                              },

                            ),
                          ),
                          SizedBox(
                            width: 20.0,

                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Never'),
                              value: 4,
                              groupValue: groupValue,
                              onChanged: (int? value){
                                setState(() {
                                  groupValue = value;
                                  rating = value;
                                });
                              },

                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 5.0,),
                      Text('What factors, if any, prevent you from engaging in preventive healthcare activities more regularly?'),
                      Container(
                        height: 30.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Outline the factors',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Text('Do you engage in regular physical activity or exercise?'),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('Yes regularly'),
                                value: 1,
                                groupValue: groupValue1,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue1 = value;
                                    rating = value;
                                  }); }
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('Yes, ocassionaly'),
                                value: 2,
                                groupValue: groupValue1,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue1 = value;
                                    rating = value;
                                  });
                                }
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('No'),
                                value: 3,
                                groupValue: groupValue1,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue1 = value;
                                    rating = value;
                                  });
                                }
                            ),
                          ),
                        ],
                      ),
                      Text('How many servings of fruits and vegetables do  you consume per day on average?'),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 20.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Kindly select an option',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text('Have you faced any barriers in accessing primary healthcare services in the past year?')),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('Yes'),
                                value: 1,
                                groupValue: groupValue2,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue2 = value;
                                    rating = value;
                                  }); }
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('No'),
                                value: 2,
                                groupValue: groupValue2,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue2 = value;
                                    rating = value;
                                  });
                                }
                            ),
                          ),
                        ],
                      ),
                      Text('Do you consume alcoholic beverages?'),
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
                                title: Text('Yes regularly'),
                                value: 1,
                                groupValue: groupValue3,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue3 = value;
                                    rating = value;
                                  }); }
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                                title: Text('Yes, ocassionaly'),
                                value: 2,
                                groupValue: groupValue3,
                                onChanged: (int? value){
                                  setState(() {
                                    groupValue3 = value;
                                    rating = value;
                                  });
                                }
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PreventiveMedicineTwo()));
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
