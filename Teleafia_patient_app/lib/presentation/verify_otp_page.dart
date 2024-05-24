
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleafia_patient/presentation/loginpage.dart';
import '../Bloc/verify_otp_bloc.dart';





class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final VerifyOtpBloc _verifyOtpBloc = VerifyOtpBloc();
  List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    _verifyOtpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _verifyOtpBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFCF4F4),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocListener<VerifyOtpBloc, VerifyOtpState>(
            listener: (context, state) {
              if (state is VerifyOtpSuccess) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              } else if (state is VerifyOtpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                ));
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xFF982B15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 30.0),
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Color(0xFF982B15),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xFF982B15),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Enter the OTP sent to your Email',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                          (index) => SizedBox(
                        width: 50,
                        child: TextField(
                          controller: controllers[index],
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counter: Offstage(),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < controllers.length - 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Collect OTP from text fields
                    List<String> otp = controllers.map((controller) => controller.text).toList();
                    String enteredOtp = otp.join(); // Join OTP codes into a single string
                    print('Entered OTP: $enteredOtp'); // Print the entered OTP for debugging
                    // Dispatch SubmitVerifyOtp event with the collected OTP
                    _verifyOtpBloc.add(SubmitVerifyOtp(enteredOtp: enteredOtp));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF982B15),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 80.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 2.0, 200.0, 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF982B15),
                    ),
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
