import 'package:flutter/material.dart';
import 'package:teleafia_partient/presentation/Productlist_screen.dart';
import 'package:teleafia_partient/presentation/prescription.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}
class _PharmacyState extends State<Pharmacy> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text('Pharmacy',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductList()),);
                    },
                    child: Text('Medicines',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Prescription()),);
                    },
                    child: Text('Prescriptions',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/pharmacy.jpg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.transparent, width: 0.5,),
              borderRadius: BorderRadius.circular(15),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Our pharmacy is equipped with high quality,affordable'
                    ' medication provided by professional,highly qualified'
                    ' and certified pharmacists. Guidance is always provided'
                    ' on accurate usage including age based dosage',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),

        ],),
    );
  }
}
