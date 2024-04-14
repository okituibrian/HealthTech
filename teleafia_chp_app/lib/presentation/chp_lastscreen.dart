import 'package:flutter/material.dart';



class LastScreen extends StatelessWidget {

  Color background = Color(0XFFFCF4F4);
  Color beige = Color(0XFFE8DBDB);
  Color maroon = Color(0XFF850808);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                    backgroundColor: background,
      ),
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
                children: [Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
          
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 600.0,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: beige,
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
                          Image.asset(
                            'assets/form.PNG', // Replace with your image path
                            fit: BoxFit.contain,
                            height: 200,
                          ),
                          SizedBox(height: 16),
          
                          Center(
                            child: Text('Form Successfully\n      Submitted',
          
                              style: TextStyle(
                                fontSize: 32,
                                color: maroon,
                              ),),
                          ),
                          SizedBox(height: 8),
          
                          Center(
                            child: Text('Thank you for your\n     cooperation',
                              // Replace with your second text
                              style: TextStyle(
                                fontSize: 24,
                                color: maroon,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Image.asset(
                            'assets/handshake.PNG', // Replace with your image path
                            fit: BoxFit.contain,
                            height: 70,
                          ),
          
          
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
