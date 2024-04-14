import 'package:flutter/material.dart';
import 'package:teleafia_partient/presentation/loginpage.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  Color maroonColor = Color(0xFF982B15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.96,
              height: MediaQuery.of(context).size.height * 0.96,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Welcome',
                      style: TextStyle(
                        color: maroonColor,
                        fontFamily: 'Lexend-Medium.ttf',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Container(
                      // width: 600,
                      //  height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/PIC1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('JOIN THE PLATFORM',
                      style: TextStyle(
                        color: maroonColor,
                        fontFamily: 'Lexend-Medium.ttf',
                        fontSize: 25.0,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: maroonColor,
                    ),
                    child: Text('Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  )
                ],
              ),

            ),
          ),
        )
    );
  }
}
