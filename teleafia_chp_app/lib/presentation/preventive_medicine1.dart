/*
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter/widgets.dart';
 //import 'package:teleafia_chp_app/presentation/preventive_medicine2.dart'

 import 'package:teleafia_chp_app/models.dart';

 class PreventiveMedicineOne extends StatefulWidget {
   final CombinedFormData formData;
   const PreventiveMedicineOne({Key? key, required this.formData}) : super(key: key);

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
     return Scaffold(backgroundColor:background,
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
                 crossAxisAlignment: CrossAxisAlignment.center,      children: [
                   Image.asset('Assets/logo.png',      width: 120,
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
                             minHeight: 5.0,
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
                             child:  RadioListTile<String>(
                               title: Text('Regular'),
                               value: 'Regular',
                               groupValue: widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           SizedBox(
                             width: 20.0,
                           ),
                           Expanded(
                             child: RadioListTile<String>(
                               title: Text('Occassional'),
                               value: 'Occassional',
                               groupValue: widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           SizedBox(
                             width: 20.0,
                           ),
                           Expanded(
                             child:  RadioListTile<String>(
                               title: Text('Rarely'),
                               value: 'Rarely',
                               groupValue: widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           SizedBox(
                             width: 20.0,

                           ),
                           Expanded(
                             child:  RadioListTile<String>(
                               title: Text('Never'),
                               value: 'Never',
                               groupValue: widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.frequencyOfPreventiveHealthCareActivities = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),

                        ],
                       ),
                       SizedBox(
                         height: 5.0,),
                       Text('What factors, if any, prevent you from engaging in preventive healthcare activities more regularly?'),
                       Container(
                         height: 40.0,
                         child: TextField(
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Outline the factors',
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
                               borderSide: BorderSide(color: maroon, width: 1.0),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
                               borderSide: BorderSide(color: maroon, width: 1.0,),

                            ),
                           ),
                           onChanged: (value) {
                             setState(() {
                               widget.formData.preventiveMedicine1Data.factorsHinderingPreventiveHealthCareActivities = value;
                             });
                           },
                         ),
                       ),
                       Text('Do you engage in regular physical activity or exercise?'),
                       Row(
                         children: [
                           Expanded(
                             flex: 1,
                             child:RadioListTile<String>(
                               title: Text('Never'),
                               value: 'Never',
                               groupValue: widget.formData.preventiveMedicine1Data.regularPhysicalActivityEngagement,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.regularPhysicalActivityEngagement = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child: RadioListTile<String>(
                               title: Text('Yes, Occassional'),
                               value: 'Yes, Ocassional',
                               groupValue: widget.formData.preventiveMedicine1Data.regularPhysicalActivityEngagement,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.regularPhysicalActivityEngagement = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child: RadioListTile<String>(
                               title: Text('No'),
                               value: 'No',
                               groupValue: widget.formData.preventiveMedicine1Data.regularPhysicalActivityEngagement,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.regularPhysicalActivityEngagement = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                         ],
                       ),
                       Text('How many servings of fruits and vegetables do  you consume per day on average?'),
                       SizedBox(
                         height: 15.0,
                       ),
                       Container(
                         height: 40.0,
                         child: TextField(
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Outline the factors',
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
                               borderSide: BorderSide(color: maroon, width: 1.0),
                             ),
                             focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0),
                               borderSide: BorderSide(color: maroon, width: 1.0,),

                             ),
                           ),
                           onChanged: (value) {
                             setState(() {
                               widget.formData.preventiveMedicine1Data.fruitsAndVegetablesConsumptionPerDay = value;
                             });
                           },
                         ),
                       ),
                       SizedBox(
                         height: 15.0,
                       ),
                       Row(
                         children: [
                           Expanded(
                               flex: 2,
                               child: Text('Do you smoke tobacco or use any other form of nicotine products??')),
                           Expanded(
                             flex: 1,
                             child:  RadioListTile<String>(
                               title: Text('Yes'),
                               value: 'Yes',
                               groupValue: widget.formData.preventiveMedicine1Data.tobaccoAndNicotineUsage,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.tobaccoAndNicotineUsage = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child: RadioListTile<String>(
                              title: Text('No'),
                               value: 'No',
                               groupValue: widget.formData.preventiveMedicine1Data.tobaccoAndNicotineUsage,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.tobaccoAndNicotineUsage = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 20.0,),
                       Text('Do you consume alcoholic beverages?'),
                       SizedBox(
                         height: 5.0,
                       ),
                       Row(
                         children: [
                           Expanded(
                           flex: 1,
                             child: RadioListTile<String>(
                               title: Text('Yes,Regularly'),
                               value: 'Yes,Regularly',
                               groupValue: widget.formData.preventiveMedicine1Data.alcoholConsumption,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.alcoholConsumption = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child:RadioListTile<String>(
                               title: Text('Yes,Occassionally'),
                               value: 'Yes,Occassionally',
                               groupValue: widget.formData.preventiveMedicine1Data.alcoholConsumption,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.alcoholConsumption = value?? '';
                                 });
                               },
                               activeColor: maroon,
                             ),),
                           Expanded(
                             flex: 1,
                             child:RadioListTile<String>(
                               title: Text('No'),
                               value: 'No',
                               groupValue: widget.formData.preventiveMedicine1Data.alcoholConsumption,
                               onChanged: (String? value) {
                                 setState(() {
                                   widget.formData.preventiveMedicine1Data.alcoholConsumption = value?? '';
                                 });
                             },
                               activeColor: maroon,
                             ),
                          ),
                         ],
                       ),
                       SizedBox(
                         height: 20.0,
                       ),
                       Center(
                         child: ElevatedButton( onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>PreventiveMedicineTwo(formData: widget.formData)));
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
               ),),),
        ),
       ),
     );

   }
 }*/
