import 'package:flutter/material.dart';

class FemaleAdolescent extends StatefulWidget {
  const FemaleAdolescent({super.key});

  @override
  State<FemaleAdolescent> createState() => _FemaleAdolescentState();
}

class _FemaleAdolescentState extends State<FemaleAdolescent> {
  double _progressValue = 0.5;
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  Color darkMaron = Color(0XFF850808);

  int? rating;
  int? groupValue;
  String? _selectedOption1;
  final List<String> _options1 = ['Condoms','Pills','injection','IUSD','implants','Natural methods'];
  bool checkBox1 = false;
  bool checkBox2 = false;
  int? yesNoGroupValue;
  int? hpv;
  int? menstrual;
  int? sexually;

  int totalQuestions = 5;
  double progressIndicator = 0.0;
  int currentQuestion = 0;

  Widget generateQuestionWidget(
      String question, String hint, List<String> options, String? selectedOption, Function(String?) onChanged) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10.0),
        SizedBox(
          height: 40.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: maroon),
              color: Colors.white,
            ),
            child: DropdownButton<String>(
              hint: Text(hint),
              value: selectedOption,
              onChanged: onChanged, // Pass onChanged callback here
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: maroon),
                  ),
                );
              }).toList(),
              style: TextStyle(color: maroon),
              dropdownColor: background,
              icon: Icon(Icons.arrow_drop_down, color: maroon),
              elevation: 2,
              underline: SizedBox(),
              isExpanded: true,
              iconSize: 30.0,
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  void indicateProgress() {
    setState(() {
      progressIndicator = currentQuestion / totalQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          backgroundColor: background,
          toolbarHeight: 30,
          leading: Padding(
            padding:const EdgeInsets.only(left: 16.0),
            child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: maroon,
                  ),
                ]
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                  children: [
                    Image.asset(
                      'assets/icon.jpg',
                      width:100,
                      height:100,
                    ),
                  ]
              ),
            ),
          ]
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top:0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(color: Colors.grey, // Choose the color you want
                  thickness: 1,
                ),// Adjust the thickness of the line)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.none,
                    width: 90,
                    height: 70, // Apply color directly to the image
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white, // Color of the bar
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.grey.withOpacity(0.5), // Fade grey color
                        ),
                        onPressed: () {
                          // Handle back arrow onPressed event
                        },
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5), // Fade grey color
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Sexual and Reproductive Health',
                        style: TextStyle(
                          color: this.darkMaron, // Color of the text
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: maroon,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: LinearProgressIndicator(
                    value: _progressValue,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(maroon),
                    minHeight: 5,
                  ),
                ),
                Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0), // Add padding to the text container
                        color: background, // Set background color of the text container
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Female Adolescents:',
                                style: TextStyle(
                                  color: darkMaron,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text('Have you received the HPV(Human Papilloma Virus) vaccine?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioListTile(
                                        title: Text('YES',
                                          style: TextStyle(
                                            color: maroon, // Setting text color to maroon
                                          ),
                                        ),
                                        value: 1,
                                        groupValue: hpv,
                                        activeColor: maroon,
                                        onChanged: (int? value){
                                          setState(() {
                                            hpv = value;
                                            rating = value;
                                            currentQuestion++;
                                            indicateProgress();
                                          }); }
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioListTile(
                                        title: Text('NO',
                                          style: TextStyle(
                                              color: maroon
                                          ),
                                        ),
                                        value: 2,
                                        groupValue: hpv,
                                        activeColor: maroon,
                                        onChanged: (int? value){
                                          setState(() {
                                            hpv = value;
                                            rating = value;
                                            currentQuestion++;
                                            indicateProgress();
                                          });
                                        }
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text('If No, would you like us to explain to your parents/ guardian the importance of the vaccine and the need to take to a healh facility?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text('Are you experiencing any menstrual irregularities or difficulties?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioListTile(
                                        title: Text('YES',
                                          style: TextStyle(
                                            color: maroon, // Setting text color to maroon
                                          ),
                                        ),
                                        value: 1,
                                        groupValue: menstrual,
                                        activeColor: maroon,
                                        onChanged: (int? value){
                                          setState(() {
                                            menstrual = value;
                                            rating = value;
                                            currentQuestion++;
                                            indicateProgress();
                                          }); }
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioListTile(
                                        title: Text('NO',
                                          style: TextStyle(
                                              color: maroon
                                          ),
                                        ),
                                        value: 2,
                                        groupValue: menstrual,
                                        activeColor: maroon,
                                        onChanged: (int? value){
                                          setState(() {
                                            menstrual = value;
                                            rating = value;
                                            currentQuestion++;
                                            indicateProgress();
                                          });
                                        }
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text('Are you sexually active? If Yes, are you using any form of contraception?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioListTile(
                                        title: Text('YES',
                                          style: TextStyle(
                                            color: maroon, // Setting text color to maroon
                                          ),
                                        ),
                                        value: 1,
                                        groupValue: sexually,
                                        activeColor: maroon,
                                        onChanged: (int? value){
                                          setState(() {
                                            sexually = value;
                                            rating = value;
                                            currentQuestion++;
                                            indicateProgress();
                                          }); }
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioListTile(
                                        title: Text('NO',
                                          style: TextStyle(
                                              color: maroon
                                          ),
                                        ),
                                        value: 2,
                                        groupValue: sexually,
                                        activeColor: maroon,
                                        onChanged: (int? value){
                                          setState(() {
                                            sexually = value;
                                            rating = value;
                                            currentQuestion++;
                                            indicateProgress();
                                          });
                                        }
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),

                              SizedBox(
                                height: 10.0,
                              ),
                              generateQuestionWidget(
                                'If Yes, please specify the form of contraception used?',
                                'Kindly specify',
                                _options1,
                                _selectedOption1,
                                    (newValue) {
                                  setState(() {
                                    _selectedOption1 = newValue;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: (){
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: maroon,
                                    minimumSize: Size(100, 50),
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Next',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward,
                                          color:Colors.white,
                                          size: 15.0,
                                        ),

                                      ]
                                  ),

                                ),
                              ),
                            ]
                        ),

                      ),
                    ]
                ),
              ]
          ),

        ),
      ),
    );
  }
}
