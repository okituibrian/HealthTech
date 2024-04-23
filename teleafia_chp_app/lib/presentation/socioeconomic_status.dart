import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teleafia_mobile_app/presentation/wash.dart';



class SocioEconomic extends StatefulWidget {
  const SocioEconomic({super.key});

  @override
  State<SocioEconomic> createState() => _SocioEconomicState();
}

class _SocioEconomicState extends State<SocioEconomic> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  double _progressValue = 0.2; // Set initial progress value
  //int _selectedRadio = -1;
  String? _selectedhouseholdIncomeLevel;
  String? _selectedhouseholdAnnualIncome;
  String? _selectedhouseholdPrimarySourceOfIncome;
  String? _selectedtypeOfResidence;
  String? _selectedtypeOfResidenceOwnership;
  //String? _selectedhouseholdAmmenities ;

  bool _householdAmmenities1 = false;
  bool _householdAmmenities2 = false;
  bool _householdAmmenities3 = false;
  bool _householdAmmenities4 = false;
  bool _householdAmmenities5 = false;
  bool _householdAmmenities6 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,),
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
                    TextField(
                      controller: TextEditingController(text: _selectedhouseholdIncomeLevel?? ''),
                      decoration: InputDecoration(
                          hintText: 'Household income level',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Bellow Poverty Line',
                                'Low Income',
                                'Moderate Income',
                                'High Income',
                                'Prefer Not to Say',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedhouseholdIncomeLevel = value;
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

                    SizedBox(height: 10.0),


                    TextField(
                      controller: TextEditingController(text: _selectedhouseholdAnnualIncome?? ''),
                      decoration: InputDecoration(
                          hintText: 'Household Annual Income',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'ksh 10000 - ksh 20000',
                                'ksh 20000 - ksh 30000',
                                'ksh 30000 - ksh 40000',
                                'More than  ksh 30000',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedhouseholdAnnualIncome = value;
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
                    SizedBox(height: 10.0),


                    TextField(
                      controller: TextEditingController(text: _selectedhouseholdPrimarySourceOfIncome?? ''),
                      decoration: InputDecoration(
                          hintText: 'Household Primary source of Income',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'Employment / Salary',
                                'Self-Employment / Business',
                                'Govt Assistant',
                                'Retirement / Pension',
                              ].map((String option) {
                                return PopupMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            onSelected: (String? value){
                              setState(() {
                                _selectedhouseholdPrimarySourceOfIncome = value;
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

                    SizedBox(height: 10.0),

                    TextField(
                      controller: TextEditingController(text: _selectedtypeOfResidence?? ''),
                      decoration: InputDecoration(
                          hintText: 'Type of residence',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                                'House',
                                'Apartment',
                                'Condominium',
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
                                _selectedtypeOfResidence = value;
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

                    SizedBox(height: 10.0),

                    TextField(
                      controller: TextEditingController(text: _selectedtypeOfResidenceOwnership?? ''),
                      decoration: InputDecoration(
                          hintText: 'Type of residence ownership',
                          suffixIcon: PopupMenuButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                              return [
                              'Owned',
                              'Rented',
                              'Govt Housing',
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
                                _selectedtypeOfResidenceOwnership = value;
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

                    SizedBox(height: 10.0),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 500, 10),
                      height: 40,
                      //width: 2000,
                      child: Text('What are your household amenities? please select below',
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Running water'),
                            value: _householdAmmenities1,
                            onChanged: (bool? value) {
                              setState(() {
                                _householdAmmenities1 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Cooling'),
                            value: _householdAmmenities2,
                            onChanged: (bool? value) {
                              setState(() {
                                _householdAmmenities2 = value!;
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
                            value: _householdAmmenities3,
                            onChanged: (bool? value) {
                              setState(() {
                                _householdAmmenities3 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Internet/Wifi'),
                            value: _householdAmmenities4,
                            onChanged: (bool? value) {
                              setState(() {
                                _householdAmmenities4 = value!;
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
                            value: _householdAmmenities5,
                            onChanged: (bool? value) {
                              setState(() {
                                _householdAmmenities5 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('Other (Specify)'),
                            value: _householdAmmenities6,
                            onChanged: (bool? value) {
                              setState(() {
                                _householdAmmenities6 = value!;
                              });
                            },
                            activeColor: maroon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Wash()));
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
      ),
    );
  }
}