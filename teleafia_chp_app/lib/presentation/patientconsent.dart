import 'package:flutter/material.dart';

class PatientConsent extends StatefulWidget {
  const PatientConsent({Key? key});

  @override
  State<PatientConsent> createState() => _PatientConsentState();
}

class _PatientConsentState extends State<PatientConsent> {
  Color maroon = Color(0xFF982B15);
  Color darkmaroon = Color(0xFF850808);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Center(
                    child: Container(
                      child: Text(
                        'Patient Consent',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: darkmaroon,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: maroon,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(maroon),
                        minHeight: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),

                  Row(
                    children: [
                      Text(
                        'I,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          //textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Patient Name',
                            contentPadding: EdgeInsets.all(1.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: maroon),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: maroon),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'hereby consent to the referral to the specialist/facility mentioned above. I understand the purpose of this referral and authorize the sharing of my medical information for the purpose of consultation and treatment',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Patient Signature',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: maroon,
                              ),
                            ),
                          ),
                          SizedBox(width: 100),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Nurse Signature',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: maroon,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 40.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: 'Please sign here',
                                  contentPadding: EdgeInsets.all(5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 100.0),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: 'Please sign here',
                                  contentPadding: EdgeInsets.all(5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: maroon),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Column(
                    children: [
                      Text(
                        'Please ensure to forward this referral form along with any accompanying medical records to the referred specialist or facility. Thank you for your attention to this matter.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Contact information',
                        contentPadding: EdgeInsets.all(5.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maroon),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maroon),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 150.0),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: maroon,
                          minimumSize: Size(500, 40),
                        ),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
