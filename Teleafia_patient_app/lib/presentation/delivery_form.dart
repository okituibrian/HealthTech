import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teleafia_patient/presentation/orders.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({super.key});

  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);

  List<String> counties = [];
  List<String> subCounties = [];
  List<String> wards = [];

  String? selectedCounty;
  String? selectedSubCounty;
  String? selectedWard;

  Map<String, List<String>> countyToSubCounties = {};
  Map<String, List<String>> subCountyToWards = {};

  @override
  void initState() {
    super.initState();
    fetchCountyData();
  }

  Future<void> fetchCountyData() async {
    final response = await http.get(Uri.parse('https://script.googleusercontent.com/macros/echo?user_content_key=eGUr17WaqI1SMb8BVxW5O1gh-6BLuswSWk575VHlESPL3GMli4FbTpSpIx0eiTy1bJzddr0_kNAu01b34EMgzcgXos9y0gNim5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPTg7q70c6bXETUWjib5naBS2mWPrs16CCi3a8yX3Gs0_7AldyRqjt8qVwNqGjCBmZ0v496HtayW-FIReJA3WTE0sUUtUBOS7g&lib=MOetB0mm9xG5ZijZygTgpHNdsv6zkqyqw'));

    if (response.statusCode == 200) {
      print('Success: ${response.statusCode} :  counties fetched');
      final data = jsonDecode(response.body)['data'] as List;
      final Map<String, Set<String>> tempCountyToSubCounties = {};
      final Map<String, Set<String>> tempSubCountyToWards = {};

      for (var item in data) {
        String county = item['County'];
        String subCounty = item['Constituency'];
        String ward = item['Ward'];

        if (county != 'County' && subCounty != 'Constituency' && ward != 'Ward') {
          if (!tempCountyToSubCounties.containsKey(county)) {
            tempCountyToSubCounties[county] = {};
          }
          tempCountyToSubCounties[county]!.add(subCounty);

          if (!tempSubCountyToWards.containsKey(subCounty)) {
            tempSubCountyToWards[subCounty] = {};
          }
          tempSubCountyToWards[subCounty]!.add(ward);
        }
      }

      setState(() {
        counties = tempCountyToSubCounties.keys.toList();
        countyToSubCounties = tempCountyToSubCounties.map((k, v) => MapEntry(k, v.toList()));
        subCountyToWards = tempSubCountyToWards.map((k, v) => MapEntry(k, v.toList()));
      });
    } else {
      throw Exception('Failed to load counties');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: background,
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HealthClientHeader(heading: 'Delivery Information'),
                    SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 40.0),
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: selectedCounty,
                            decoration: InputDecoration(
                              labelText: 'County',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                            items: counties.map((county) {
                              return DropdownMenuItem(
                                value: county,
                                child: Text(county),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedCounty = newValue;
                                selectedSubCounty = null;
                                selectedWard = null;
                                subCounties = countyToSubCounties[newValue]!;
                                wards = [];
                              });
                            },
                          ),
                          SizedBox(height: 10.0),
                          DropdownButtonFormField<String>(
                            value: selectedSubCounty,
                            decoration: InputDecoration(
                              labelText: 'Sub-County',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                            items: subCounties.map((subCounty) {
                              return DropdownMenuItem(
                                value: subCounty,
                                child: Text(subCounty),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedSubCounty = newValue;
                                selectedWard = null;
                                wards = subCountyToWards[newValue]!;
                              });
                            },
                          ),
                          SizedBox(height: 10.0),
                          DropdownButtonFormField<String>(
                            value: selectedWard,
                            decoration: InputDecoration(
                              labelText: 'Ward',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Color(0xFF982B15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                            items: wards.map((ward) {
                              return DropdownMenuItem(
                                value: ward,
                                child: Text(ward),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedWard = newValue;
                              });
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Street name',
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
                              labelText: 'House/Appartment',
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
                              labelText: 'Phone Number',
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
                                    content: Center(
                                      child: Text(
                                        "Your order has successfully been made and is being packaged and will be delivered accordingly",
                                      ),
                                    ),
                                    backgroundColor: maroon,
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 5),
                                  ),
                                );
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyOrders(),
                                    ),
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: maroon,
                              ),
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
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
            ),
          ),
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }
}
