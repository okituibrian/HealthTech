import'package:flutter/material.dart';

class ChpDashboard extends StatefulWidget {
  const ChpDashboard({super.key});

  @override
  State<ChpDashboard> createState() => _ChpDashboardState();
}

class _ChpDashboardState extends State<ChpDashboard> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Container(
            //height: 1000.0,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: maroon,
                width: 3.0,

                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 60, // Apply color directly to the image
                  ),
                ),
                SizedBox(height: 20.0),

                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/PIC.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 1),
                // Add space between image and text
                Text(
                  'Community Health\n       Promotion',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: maroon,
                  ),
                ),
                SizedBox(height: 10),
                // Add space between text and container
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: Text(
                    'This exercise examines Primary Healthcare, Household illness trends, WASH conditions and preventive medicine  at grassroots levels. It aims to identify  areas for improvement Develop targeted interventions and Address the need of low socio-economic groups, guided by WHO guideines.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: maroon,
                    ),
                  ),
                ),
                SizedBox(height: 0), // Add space between container and row
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: context()=>SocioEconomicsState));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home, color: maroon),
                                  SizedBox(height: 4), // Adjust spacing between icon and text
                                  Text(
                                    'Add household', style: TextStyle(color: maroon),

                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 30,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0XFFEFBF24),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: context()=>SocioEconomicsState));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                backgroundColor: maroon,
                                // Adjust blur as needed
                                // Specify the shadow color
                                // You can adjust other boxShadow properties like offset, spreadRadius, etc.
                              ),
                              child: Text('Start', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: context()=>SocioEconomicsState));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person_add_sharp, color: maroon),
                                SizedBox(height: 4), // Adjust spacing between icon and text
                                Text(
                                  'Add household members', style: TextStyle(color: maroon),
                                ),
                              ],
                            ),
                          ),
                        )],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
