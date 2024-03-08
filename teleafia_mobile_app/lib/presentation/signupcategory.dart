import 'package:flutter/material.dart';

class EquityafiaLogo extends StatefulWidget {
  const EquityafiaLogo({super.key});

  @override
  State<EquityafiaLogo> createState() => _EquityafiaLogoState();
}

class _EquityafiaLogoState extends State<EquityafiaLogo> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          color: background,
          width: MediaQuery.of(context).size.width *1,
          height: MediaQuery.of(context).size.height *1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/Afialogo.jpg',
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/Hosp.jpg',
                        width: 500,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                children: [
                  Center(
                    child: Text('Please select your category to sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: maroon,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(50.0),
                      child: Icon(Icons.contact_emergency, color: maroon,),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(50.0),
                      child: TextButton(onPressed: (){},
                        style: TextButton.styleFrom(backgroundColor: Colors.red,),
                        child: Text('PATIENT', style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white,
                        ),

                        ),),

                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(50.0),
                      child: Icon(Icons.contact_emergency, color: maroon,),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(50.0),
                      child: TextButton(onPressed: (){},
                        style: TextButton.styleFrom(backgroundColor: Colors.red,),
                        child: Text('CHP', style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white,
                        ),

                        ),),

                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}