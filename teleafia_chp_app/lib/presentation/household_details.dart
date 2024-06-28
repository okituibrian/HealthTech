import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teleafia_chp_app/presentation/socioeconomic_status.dart';
import 'package:teleafia_chp_app/models.dart';

class HouseHoldDetails extends StatefulWidget {
  HouseHoldDetails({Key? key}) : super(key: key);

  @override
  State<HouseHoldDetails> createState() => _HouseHoldDetailsState();
}

class _HouseHoldDetailsState extends State<HouseHoldDetails> {
  final _formKey = GlobalKey<FormState>();
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFF982B15);
  CombinedFormData formData = CombinedFormData(
    householdDetailsData: HouseholdDetailsFormData(),
    socioEconomicData: SocioEconomicFormData(),
    householdIllnessData: HouseholdIllnessFormData(),
    washData: WashFormData(),
      householdHealthProfileData: HouseholdHealthProfileFormData(),
      preventiveMedicine1Data: PreventiveMedicine1FormData(),
      preventiveMedicine2Data: PreventiveMedicine2FormData(),

  );

   String? validateHouseholdNumber(String? value) {
    if (value == null || value.isEmpty) {
        return 'Please enter household number';
    }
    return null;
   }

  String? validateNationality(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter nationality';
    }
  }

  String? validateCounty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter county';
    }
  }

  String? validateSubCounty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter subcounty';
    }
  }

  String? validateConstituency(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter constituency';
    }
  }

  String? validateWard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ward';
    }
  }

  String? validateCommunityUnit(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter community unit';
    }
  }

  String? validateHouseholdSize(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter household size';
    }
  }

  String? validateNumberOfChildrenUnderFive(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number of children under five';
    }
  }
  void _showErrorDialog(List<String> errorMessages) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Validation Error'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: errorMessages.map((message) => Text(message)).toList(),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {

              });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1,
                      color: background,
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.0),
                            SizedBox(height: 10.0),
                            SizedBox(height: 30.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Household Number',
                                  labelText: 'Household Number',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.householdNumber = value;
                                  });
                                },
                                validator: validateHouseholdNumber,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Nationality',
                                  labelText: 'Nationality',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.nationality = value;
                                  });
                                },
                                validator: validateNationality,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'County',
                                  labelText: 'County',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.county = value;
                                  });
                                },
                                validator: validateCounty,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'SubCounty',
                                  labelText: 'SubCounty',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.subCounty = value;
                                  });
                                },
                                validator: validateSubCounty,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Constituency',
                                  labelText: 'Constituency',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.constituency = value;
                                  });
                                },
                                validator: validateConstituency,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Ward',
                                  labelText: 'Ward',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.ward = value;
                                  });
                                },
                                validator: validateWard,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Community Unit',
                                  labelText: 'Community Unit',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.communityUnit = value;
                                  });
                                },
                                validator: validateCommunityUnit,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Household size',
                                  labelText: 'Household Size',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.householdSize = value;
                                  });
                                },
                                validator: validateHouseholdSize,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Number of children under 5years',
                                  labelText: 'Number of children under 5years',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: maroon, width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formData.householdDetailsData.numberOfUnderFive = value;
                                  });
                                },
                                validator: validateNumberOfChildrenUnderFive,
                              ),
                            ),
                            SizedBox(height: 40.0),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Expanded(
                    child: Container(
                      color: background,
                      child: Center(
                        child: Text(
                          'Household Details',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: maroon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 120,
                  right: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If all fields are valid, navigate to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SocioEconomic(formData: formData),
                          ),
                        );
                      } else {
                        // Show error dialog with the error messages
                        List<String> errorMessages = [];
                        if (validateHouseholdNumber(formData.householdDetailsData.householdNumber) != null) {
                          errorMessages.add('Please enter household number');
                          formData.householdDetailsData.householdNumber = '';
                        }else if (validateNationality(formData.householdDetailsData.nationality) != null) {
                      errorMessages.add('Please enter nationality');
                      }else if (validateCounty(formData.householdDetailsData.county) != null) {
                      errorMessages.add('Please enter county');
                      }else if (validateSubCounty(formData.householdDetailsData.subCounty) != null) {
                      errorMessages.add('Please enter Subcounty');
                      }else if(validateConstituency(formData.householdDetailsData.constituency) != null) {
                      errorMessages.add('Please enter constituency');
                      }else if(validateWard(formData.householdDetailsData.ward) != null) {
                          errorMessages.add('Please enter ward');
                        }else if(validateHouseholdSize(formData.householdDetailsData.householdSize) != null) {
                          errorMessages.add('Please enter household size');
                        }else if(validateNumberOfChildrenUnderFive(formData.householdDetailsData.numberOfUnderFive) != null) {
                          errorMessages.add('Please enter number of children under five');

                        }
                        _showErrorDialog(errorMessages);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: maroon,
                      minimumSize: Size(80, 50),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
