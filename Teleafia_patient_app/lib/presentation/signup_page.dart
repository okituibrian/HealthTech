import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:teleafia_patient/Bloc/registerbloc/register_bloc.dart';
import 'package:teleafia_patient/presentation/verify_otp_page.dart';

class PatientSignupPage extends StatefulWidget {
  const PatientSignupPage({super.key});

  @override
  State<PatientSignupPage> createState() => _PatientSignupPageState();
}



class _PatientSignupPageState extends State<PatientSignupPage> {
  Color background = Color(0xFFFCF4F4);
  Color maroon = Color(0xFF982B15);
  bool _obsecureText = true;
  DateTime selectedDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  bool _isObscured = true;


  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        locationController.text =
        'Lat: ${position.latitude}, Long: ${position.longitude}';
        print("${position.latitude}, Long: ${position.longitude}");
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
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
                        'Proceed with your',
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Phone',
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
                    ),
                    SizedBox(height: 20.0),
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
                    SizedBox(height: 20.0),
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
                    SizedBox(height: 20.0),
                    Expanded(
                      flex: 1,
                      child:  Container(
                        height: 40.0,
                        child: TextField(
                          controller: locationController,
                          readOnly: true,
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
                    SizedBox(height: 20.0),
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
                          if (confirmPasswordController.text == passwordController.text) {
                            registerBloc.add(RegisterButtonWhenPressed(
                              name: nameController.text,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text,
                              idNumber: idNumberController.text,
                              dateOfBirth: dateOfBirthController.text,
                              location: locationController.text,
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
