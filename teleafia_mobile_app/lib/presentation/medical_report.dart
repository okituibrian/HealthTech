import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teleafia_mobile_app/presentation/patientconsent.dart';

class MedicalReport extends StatefulWidget {
  const MedicalReport({super.key});
  @override
  State<MedicalReport> createState() => _MedicalReportState();
}
class _MedicalReportState extends State<MedicalReport> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);
  Color white = Color(0xFFFFFF);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width *0.96,
        height: MediaQuery.of(context).size.height *0.96,
        child: Scaffold(
          //appBar: AppBar(
          // backgroundColor: background,),
          body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  Center(
                    child: Image.asset('assets/logo.png',
                      
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    child: Text('Medical Reporting Form',
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
                        minHeight: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Household Number',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'dd/mm/yyyy',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Referring Nurse',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: darkmaroon,
                            ),
                          ),
                          SizedBox(width: 750.0,),
                          Row(
                            children: [
                              Text('Facility/Clinic',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: darkmaroon,
                                ) ,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Nurse Name',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 500.0,),
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Facility/Clinic Name',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Column(
                      children: [
                        Row(
                          children: [
                            Text('Relevant Medical Conditions',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: darkmaroon,
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'List any relevant medical conditions',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Current Medications',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: darkmaroon,
                            ),
                          ),
                          SizedBox(width: 750.0,),
                          Row(
                            children: [
                              Text('Allergies',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: darkmaroon,
                                ) ,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'List any current medications',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 500.0,),
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'List any known allergies',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Column(
                      children: [
                        Row(
                          children: [
                            Text('Past Surgical History',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: darkmaroon,
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Provide details of any past surgeries',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Column(
                      children: [
                        Row(
                          children: [
                            Text('Past Medical History',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: darkmaroon,
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Provide details of any past medical history',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Column(
                      children: [
                        Row(
                          children: [
                            Text('Diagnostic Tests',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: darkmaroon,
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'List any diagnostic tests or reports'
                                  ' attached with referral form',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Specialist/Facility referred to:',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: darkmaroon,
                            ),
                          ),
                          SizedBox(width: 750.0,),
                          Row(
                            children: [
                              Text('Reason for Reporting',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: darkmaroon,
                                ) ,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Name of Specialist/Facility',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 500.0,),
                      Container(
                        width: 350.0,
                        height: 30.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Reason for reporting concerns',
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => PatientConsent()));
                    },
                      style: TextButton.styleFrom(backgroundColor: maroon,
                        minimumSize: Size(300, 40),
                      ),
                      child: Text('Next',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,

                        ),

                      ),),),

                ]),
          ),),),
    );
  }
}
