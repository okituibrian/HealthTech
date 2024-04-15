import 'package:flutter/material.dart';
import 'package:teleafia_partient/presentation/delivery_form.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}
class _PaymentState extends State<Payment> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  Color darkMaron = Color(0XFF850808);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: background,
      //appBar: AppBar(backgroundColor: background,),
      body: Padding(
        padding:  const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('Assets/logo.png',
                width: 120,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.0,),
            Container(
              width: 300,
              height: 30,
              decoration: BoxDecoration(
                color: background,
                border: Border.all(color: maroon, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text('Pay Via',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: 350,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: maroon, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'Assets/mpesa.png',
                    width: 150,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Enter phone number',
                                  contentPadding: EdgeInsets.all(2.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon, width: 0.5),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon, width: 0.5),
                                    borderRadius: BorderRadius.circular(4.0),)
                              ),
                            ),
                          ),
                          SizedBox(height: 3.0,),
                          Container(
                            width: 180,
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Enter amount',
                                  contentPadding: EdgeInsets.all(2.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon, width: 0.5),
                                    borderRadius: BorderRadius.circular(4.0),),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon, width: 0.5),
                                    borderRadius: BorderRadius.circular(4.0),)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: maroon, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Pay with card',
                            style: TextStyle(
                              color: maroon,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,),),
                        ),
                      ),
                      Image.asset(
                        'Assets/visa.png',
                        width: 100,
                        height: 70,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Amount',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Card Number',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Expiry Date',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryForm()),);
                    },
                      style: TextButton.styleFrom(backgroundColor: maroon,
                        minimumSize: Size(100, 40),),
                      child: Text('Pay Now',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
