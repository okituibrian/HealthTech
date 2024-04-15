import 'package:flutter/material.dart';
import 'package:teleafia_partient/presentation/pharmacy.dart';

class Submitpresc extends StatefulWidget {
  const Submitpresc({super.key});

  @override
  State<Submitpresc> createState() => _SubmitprescState();
}

class _SubmitprescState extends State<Submitpresc> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Prescription Uploads',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 200.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: maroon, width: 0.5,),
                borderRadius: BorderRadius.circular(15),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: darkmaroon,
                      radius: 20,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Your prescription is successfully uploaded',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: maroon,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 2.0,
                      color: maroon,
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      'Kindly wait as we check and validate its legitimacy and availability before you proceed to pay',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/hand.PNG',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Thank you for choosing Equity Afia',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Pharmacy()),);
                },
                style: TextButton.styleFrom(
                  backgroundColor: maroon,
                  minimumSize: Size(150, 40),),
                child: Text(
                  'BACK',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
