import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/presentation/household_details.dart';
import 'package:teleafia_mobile_app/presentation/memberdetails.dart';
import 'package:teleafia_mobile_app/presentation/socioeconomic_status.dart';
import 'package:teleafia_mobile_app/presentation/loginpage.dart';


class ChpDashboard extends StatefulWidget {
   ChpDashboard({Key? key}) : super(key: key); // Fixed syntax for super constructor

  @override
  State<ChpDashboard> createState() => _ChpDashboardState();
}

class _ChpDashboardState extends State<ChpDashboard> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);

  /*void _handleLogout() async {

    // For example, if Wilson is using shared preferences to store session data:
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.clear(); // Clear all stored data

    // Navigate to the login screen
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginPage()),
    // );

    print('User logged out!');
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                // Show popup menu for options
                showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    MediaQuery.of(context).size.width - 50, 0, 0, 0,
                  ),
                  items: [
                    PopupMenuItem<String>(
                      value: 'Profile',
                      child: Text('Profile'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Logout',
                      child: Text('Logout'),
                    ),
                  ],
                ).then((value) {
                  // Handle the selected option
                  if (value == 'Logout') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }
                });
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: maroon,
                ),
              ),
            ),
            SizedBox(width: 10),
            
          ],
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Container(
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
                    height: 60,
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

                Text(
                  'Community Health\n Promotion',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: maroon,
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'This exercise examines Primary Healthcare, Household illness trends, WASH conditions and preventive medicine  at grassroots levels. It aims to identify  areas for improvement Develop targeted interventions and Address the need of low socio-economic groups, guided by WHO guidelines.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: maroon,
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MemberDetails()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home, color: maroon),
                                SizedBox(height: 4),
                                Text(
                                  'Add household',
                                  style: TextStyle(color: maroon),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HouseHoldDetails()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                backgroundColor: maroon,
                              ),
                              child: Text(
                                'Start',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HouseHoldDetails()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person_add_sharp, color: maroon),
                                SizedBox(height: 4),
                                Text(
                                  'Add household members',
                                  style: TextStyle(color: maroon),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
