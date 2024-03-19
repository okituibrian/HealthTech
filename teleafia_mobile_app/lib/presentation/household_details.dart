import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseHoldDetails extends StatefulWidget {
  const HouseHoldDetails({super.key});

  @override
  State<HouseHoldDetails> createState() => _HouseHoldDetailsState();
}

class _HouseHoldDetailsState extends State<HouseHoldDetails> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  double _progressValue = 0.1; // Set initial progress value

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                          'Household Details',
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

                    TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Household Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'Nationality',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'County',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'Constituency',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'Ward',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'Community Unity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'Household size (including anyone living with you)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
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
                        hintText: 'Number of children Under 5 year old',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: maroon),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),

                    ElevatedButton(
                      onPressed: () {},
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

