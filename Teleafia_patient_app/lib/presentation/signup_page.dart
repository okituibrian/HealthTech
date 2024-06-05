
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:teleafia_patient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_patient/presentation/verify_otp_page.dart';
import '../shared/health_client_functions.dart';
import 'countrycode.dart';


class PatientSignupPage extends StatefulWidget {
  const PatientSignupPage({super.key});

  @override
  State<PatientSignupPage> createState() => _PatientSignupPageState();
}

class _PatientSignupPageState extends State<PatientSignupPage> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  final List<String> _gender1 = ['female', 'male'];
  String? _selectedGender;
  DateTime selectedDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  bool _isObscured = true;
  late String selectedCountryCode;
  late List<String> parts;
  late String selectedCode;
  String defaultCode = '+254';

  Position? _currentLocation;
  String _currenAddress = "";
  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationController.text = 'Location services are disabled.';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationController.text = 'Location permissions are denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationController.text = 'Location permissions are permanently denied.';
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String? locality = place.locality;
        String? city = place.administrativeArea;
        String? country = place.country;

        // Print full Placemark data for debugging
        print("Placemark data: $place");

        setState(() {
          locationController.text =
          'Locality: ${locality ?? 'Unknown locality'}, City: ${city ?? 'Unknown city'}, Country: ${country ?? 'Unknown country'}';
          print("Locality: ${locality ?? 'Unknown locality'}, City: ${city ?? 'Unknown city'}, Country: ${country ?? 'Unknown country'}");
        });
      } else {
        setState(() {
          locationController.text = 'No placemarks found';
          print("No placemarks found");
        });
      }
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        locationController.text = 'Error getting location: $e';
      });
    }
  }



  @override
  void initState() {
    super.initState();
    selectedCountryCode = '+254 Kenya';
    parts = selectedCountryCode.split(' ');
    selectedCode = parts[0];
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: maroon,
                ),
              );
            } else if (state is RegisterSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Verify()),
                );
              });
            } else if (state is RegisterFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed: please try again'),
                  ),
                );
              });
            }
            return SafeArea(
              child: Container(
                color: background,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Proceed complete',
                          style: TextStyle(
                            color: maroon,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend-Medium.ttf',
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'REGISTRATION',
                          style: TextStyle(
                            color: maroon,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend-Medium.ttf',
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40.0,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              prefixIcon: Icon(
                                Icons.contact_emergency,
                                color: maroon,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40.0,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: maroon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: maroon),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: maroon),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButton<String>(
                              value: selectedCountryCode.isEmpty ? null : selectedCountryCode,
                              hint: Text('Select Country Code'),
                              icon: Icon(Icons.arrow_drop_down),
                              underline: SizedBox(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCountryCode = newValue!;
                                });
                              },
                              items: CountryCode.countries.map<DropdownMenuItem<String>>((Map<String, String> country) {
                                return DropdownMenuItem<String>(
                                  value: country['code']! + ' ' + country['name']!, // Ensure uniqueness by using code + name combination
                                  child: Text(country['code']! + ' ' + country['name']!),
                                );
                              }).toList(),
                            ),

                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'eg. 763000000',
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: maroon,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: maroon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40.0,
                          child: TextField(
                            controller: idNumberController,
                            decoration: InputDecoration(
                              hintText: 'ID',
                              prefixIcon: Icon(
                                Icons.perm_identity,
                                color: maroon,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: dateOfBirthController,
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          decoration: InputDecoration(
                            hintText: 'Date Of Birth',
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: maroon,
                              ),
                              onPressed: () => _selectDate(context),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        flex: 1,
                        child:  Container(
                          height: 60.0,
                          child: TextField(
                            controller: locationController,
                            // readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Location",
                              filled: true,
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.location_on,
                                  color: maroon,
                                ),
                                onPressed: () => _getLocation,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40.0,
                          child: TextFields().generateDropdownnWidget(
                            'Gender',
                            _gender1,
                            _selectedGender,
                                (newValue) {
                              setState(() {
                                _selectedGender = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40.0,
                          child: TextField(
                            controller: passwordController,
                            obscureText: _isObscured,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: maroon,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscured ? Icons.visibility : Icons.visibility_off,
                                  color: maroon,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40.0,
                          child: TextField(
                            controller: confirmPasswordController,
                            obscureText: _isObscured,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(
                                Icons.check,
                                color: maroon,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscured ? Icons.visibility : Icons.visibility_off,
                                  color: maroon,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            final registerBloc = BlocProvider.of<RegisterBloc>(context);
                            String phoneNumber;
                            if (confirmPasswordController.text == passwordController.text) {
                              // Check if the selected country code is not +254 Kenya
                              if (selectedCountryCode != '+254 Kenya') {
                                // Extract the selected code from selectedCountryCode
                                List<String> parts = selectedCountryCode.split(' ');
                                String selectedCode = parts[0];
                                // Append the selected code to the phone number
                                phoneNumber = selectedCode + phoneNumberController.text;
                              } else {
                                // Use the selected country code directly
                                phoneNumber = defaultCode + phoneNumberController.text;
                              }
                              print('Name: ${nameController.text}');
                              print('Email: ${emailController.text}');
                              print('Phone Number: $phoneNumber');
                              print('ID Number: ${idNumberController.text}');
                              print('Date of Birth: ${dateOfBirthController.text}');
                              print('Location: ${locationController.text}');
                              print('Gender: $_selectedGender');
                              print('Password: ${passwordController.text}');
                              print('Confirm Password: ${confirmPasswordController.text}');

                              registerBloc.add(RegisterButtonWhenPressed(
                                name: nameController.text,
                                email: emailController.text,
                                phoneNumber: phoneNumber,
                                idNumber: idNumberController.text,
                                dateOfBirth: dateOfBirthController.text,
                                location: locationController.text,
                                gender: _selectedGender,
                                password: passwordController.text,
                                confirm_password: confirmPasswordController.text,
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Passwords do not match'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: maroon,
                          ),
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900), // Adjust this to a reasonable minimum date for birth dates
      lastDate: DateTime.now(), // Prevent selecting future dates for date of birth
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateOfBirthController.text = DateFormat('MM-dd-yyyy').format(pickedDate);
      });
    }
  }
}
