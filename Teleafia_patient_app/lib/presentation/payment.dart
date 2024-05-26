import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teleafia_patient/presentation/delivery_form.dart';
import 'package:teleafia_patient/presentation/my_appointments.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';

class Payment extends StatefulWidget {
  final String billingId;
  final String appointmentId;


  const Payment({super.key, required this.billingId, required this.appointmentId});

  @override
  State<Payment> createState() => _PaymentState();
}


class _PaymentState extends State<Payment> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFFc00100);
  Color darkMaron = Color(0XFF850808);
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HealthClientHeader(heading: 'Payment Method'),
            SizedBox(height: 5.0),
            Container(
              width: 300,
              height: 30,
              decoration: BoxDecoration(
                color: background,
                border: Border.all(color: maroon, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Pay Via',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 350,
              height: 100,
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
                            height: 40,
                            child: TextField(
                              controller: mobileNumberController,
                              decoration: InputDecoration(
                                hintText: 'Enter phone number',
                                contentPadding: EdgeInsets.all(2.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: maroon, width: 0.5),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: maroon, width: 0.5),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                postNumberToServer();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: maroon,
                                minimumSize: Size(60, 40),
                              ),
                              child: Text(
                                'Pay',
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: maroon, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Pay with card',
                            style: TextStyle(
                              color: maroon,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'Assets/visa.png',
                        width: 100,
                        height: 70,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Card Number',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Expiry Date',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              DeliveryForm()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: maroon,
                        minimumSize: Size(100, 40),
                      ),
                      child: Text(
                        'Pay Now',
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
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  void postNumberToServer() async {
    // Backend active API endpoint
    String mobileNumber = mobileNumberController.text;
    print("Mobile Number: $mobileNumber");

    // Determine the correct API URL based on whether appointmentId or billingId is provided
    String apiUrl = widget.appointmentId != null &&
        widget.appointmentId.isNotEmpty
        ? 'https://697f-102-220-12-50.ngrok-free.app/api/payments/makestkpayments/${widget
        .appointmentId}'
        : 'https://697f-102-220-12-50.ngrok-free.app/api/payments/makestkpayments/${widget
        .billingId}';

    // Data payload
    Map<String, String> data = {
      'mobileNumber': mobileNumber,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );

      if (response.statusCode == 200) {
        if (widget.appointmentId != null && widget.appointmentId.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyAppointments()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeliveryForm()),
          );
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('please wait for Mpesa to reply'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.reasonPhrase}'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}