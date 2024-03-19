import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreventiveMedicineTwo extends StatefulWidget {
  const PreventiveMedicineTwo({super.key});

  @override
  State<PreventiveMedicineTwo> createState() => _PreventiveMedicineOneState();
}

class _PreventiveMedicineOneState extends State<PreventiveMedicineTwo> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  Color darkMaron = Color(0XFF850808);
  int? rating;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('Assets/equiafia logo.png',
                      width: 120,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
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
                  Text('Immunizations and Preventive Screenings',
                    style: TextStyle(
                      color: darkMaron,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('Are you up to date with your routine immunizations(e.g., flu vaccine, tetanus shot)?'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text('YES'),
                          value: 1,
                          groupValue: groupValue1,
                          onChanged: (int? value){
                            setState(() {
                              groupValue1 = value;
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
                          title: Text('NO'),
                          value: 2,
                          groupValue: groupValue1,
                          onChanged: (int? value){
                            setState(() {
                              groupValue1 = value;
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
                          title: Text('Not Sure'),
                          value: 3,
                          groupValue: groupValue1,
                          onChanged: (int? value){
                            setState(() {
                              groupValue1 = value;
                              rating = value;
                            });
                          },

                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,),
                  Text('When was your last medical check-up or preventive screening(e.g., blood pressure, cholesterol)?'),
                  Container(
                    height: 30.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Outline the factors',
                        suffixIcon: PopupMenuButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          //enabled: false,
                          itemBuilder: (BuildContext context){
                            return['Within the past year', '1-2 years ago', 'More than 2 years ago', 'never'].map((String option){
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
                  Text('Have you undergone any cancer screenings(e.g., mammogram, colonoscopy) as recommended for your age and gender?'),
                  Row(
                    children: [
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
                            title: Text('NO'),
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
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                            title: Text('Not Sure'),
                            value: 3,
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
                  Text('Health Information and Awareness',
                    style: TextStyle(
                      color: darkMaron,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,

                    ),),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('How do you stay informed about preventive health measures?'),
                  Container(
                    height: 30.0,
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
                        child: Text('Have you received education or counseling on preventive health measures from a healthcare provider in the past year?'),),
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                            title: Text('YES'),
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
                            title: Text('NO'),
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
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(200, 50),
                      ),
                      child: Text('Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),),
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
