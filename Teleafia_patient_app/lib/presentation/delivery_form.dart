import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/bottom_nav.dart';




class DeliveryForm extends StatefulWidget {
  const DeliveryForm({super.key});

  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {

  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: background,


      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: background,
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/logo.png',

                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Location',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: maroon,
                            ),
                          ),
                          SizedBox(height: 10.0),

                          TextFormField(

                            decoration: InputDecoration(
                              hintText: 'County',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),

                          TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Sub-County',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),

                            ),
                          ),
                          SizedBox(height: 10.0),

                          TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Town',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),

                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Street name',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),

                          TextFormField(

                            decoration: InputDecoration(
                              hintText: 'House / Apartment',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),

                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text("Your order has successfully been made and is being packaged and will be delivered  accordingly")), // Center the content
                                    backgroundColor: maroon, // Set background color
                                    behavior: SnackBarBehavior.floating, // Display at the center
                                    duration: Duration(seconds: 5),
                                  ),
                                );
                                Future.delayed(Duration(seconds: 5), () {
                                  Navigator.pop(context); // Pop the current route after 5 seconds
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: maroon,
                              ),
                              child: Text(
                                'COMPLETE ORDER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ]
                ),

              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: HealthClientFooter(),
    );

  }
}