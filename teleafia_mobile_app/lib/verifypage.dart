import 'package:flutter/material.dart';


class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Color maroon = Color(0xFF982B15); // Define your colors here
  Color background = Color(0xFFFCF4F4);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(2.0, 60.0, 2.0, 10.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: maroon,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 30.0),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: maroon,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: maroon,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0),

              Text('Enter the OTP sent via phone or email',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

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

              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: maroon,
                ),
                child: Text('Confirm',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),

              SizedBox(height: 80.0),

              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 2.0,200.0, 10.0),
                child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maroon,
                  ),

                  child: Text('Resend code',
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
    );
  }
}
