import 'package:flutter/material.dart';

class HouseholdIllness extends StatefulWidget {
  const HouseholdIllness({super.key});

  @override
  State<HouseholdIllness> createState() => _HouseholdIllnessState();
}

class _HouseholdIllnessState extends State<HouseholdIllness> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);
  int? rating;
  int? groupValue;
  bool? checkBox1 = false;
  bool? checkBox2 = false;
  bool? checkBox3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // backgroundColor: background,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
              SizedBox(height: 10.0,),
              Container(
                child: Center(
                  child: Text('Household Health Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: darkmaroon,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
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
              SizedBox(height: 10.0,),
              Container(
                child:
                Text('Prevention and Health Practices',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: darkmaroon,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                child:
                Text('What preventive measures does your household take to prevent'
                    ' the risk of illnesses?',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 1245,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Preventive measures',
                        contentPadding: EdgeInsets.all(5.0),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(100, 100, 0, 0),
                              items: [
                                CheckedPopupMenuItem(
                                  checked: false,
                                  value: 'Handwashing with soap and water',
                                  child: Text('Handwashing with soap and water'),),
                                CheckedPopupMenuItem(
                                  checked: false,
                                  value: 'Regular disinfection of surfaces',
                                  child: Text('Regular disinfection of surfaces'),),

                                CheckedPopupMenuItem(
                                  checked: false,
                                  value: 'Vaccination',
                                  child: Text('Vaccination'),
                                ),
                                CheckedPopupMenuItem(
                                  checked: false,
                                  value: 'Safe food handling practices',
                                  child: Text('Safe food handling practices'),
                                ), CheckedPopupMenuItem(
                                  checked: false,
                                  value: 'Adequate ventilation in living spaces',
                                  child: Text('Adequate ventilation in living spaces'),
                                ),
                                CheckedPopupMenuItem(
                                  checked: false,
                                  value: 'Others(Specify)',
                                  child: Text('Others(Specify)'),
                                ),],);},),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maroon),
                          borderRadius: BorderRadius.circular(10.0),),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maroon),
                          borderRadius: BorderRadius.circular(10.0),),
                      ),),),],),
              SizedBox(height: 10.0,),
              Container(
                child:
                Text('Are there any barriers to accessing healthcare services'
                    ' for illnesses within your household?'
                    ' If yes, please specify',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                        title: Text('Geographical'),
                        value: checkBox1,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBox1 = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title: Text('Financial'),
                        value: checkBox2,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBox2 = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title: Text('Cultural'),
                        value: checkBox3,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBox3 = value!;
                          });
                        }),
                  ), ],
              ),
              SizedBox(height: 5.0),
              Text('Child Health Status',
                style: TextStyle(
                  color: maroon,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 5.0,),
              Text('Kindly proceed to fill the health status for'
                  ' household children below the age of 5years'),
              SizedBox(height: 150.0,),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextButton(onPressed: (){},
                  style: TextButton.styleFrom(backgroundColor: maroon,
                    minimumSize: Size(500, 40),
                  ),
                  child: Center(
                    child: Text('Next',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),),),

            ] ),
      ),
    );
  }
}
