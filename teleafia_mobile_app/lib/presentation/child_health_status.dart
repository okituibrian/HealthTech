
import 'package:flutter/material.dart';
import 'package:teleafia_mobile_app/presentation/preventive_medicine1.dart';
import 'package:teleafia_mobile_app/shared/bottom_nav.dart';
import 'package:teleafia_mobile_app/shared/header.dart';
import 'package:teleafia_mobile_app/shared/health_promoter_quiz.dart';

import 'maternal_child_health.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChildHealthStatus(),
    );
  }
}

class ChildHealthStatus extends StatefulWidget {
  const ChildHealthStatus({Key? key}) : super(key: key);

  @override
  ChildHealthStatusState createState() => ChildHealthStatusState();
}

class ChildHealthStatusState extends State<ChildHealthStatus> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);
  // Set initial progress value
  bool? _childHealthSelectedOption1;
  bool? _childHealthSelectedOption2;
  bool? _childHealthSelectedOption3;
  bool? _childHealthSelectedOption4;
  List<String> _childHealthQuizOptions1 = [
    'Green',
    'Yellow',
    'Red',
    'Not Done'
  ];
  List<String> _childHealthQuizOptions2 = ['Breastfed', 'Formula-fed', 'Both'];

  String? _childHealthSelectedOption5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(title: 'Child Health Status'),
              HealthPromoterQuizState()
                  .Headline('For Children Below 5 Years of Age'),
              HealthPromoterQuizState().BuildYesNoQuiz(
                  "Is the child's immunization status up to date?",
                  _childHealthSelectedOption1, (bool? value) {
                setState(() {
                  _childHealthSelectedOption1 = value;
                });
              }),
              HealthPromoterQuizState().GenerateQuestionWidget(
                "What is the child's MUAC (Mid-Upper Arm Circumference) score?",
                'Kindly select',
                _childHealthQuizOptions1,
                _childHealthSelectedOption5,
                (newValue) {
                  setState(() {
                    _childHealthSelectedOption5 = newValue;
                  });
                },
              ),
              HealthPromoterQuizState().BuildYesNoQuiz(
                  'If the two conditions above are not met, would you be willing to provide consent for medical referall if necessary?',
                  _childHealthSelectedOption2, (bool? value) {
                setState(() {
                  _childHealthSelectedOption2 = value;
                });
              }),
              HealthPromoterQuizState().FormRedirectLink(
                'If YES kindly proceed to fill the ',
                'MEDICAL REPORTING FORM',
                () {},
              ),
              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Has the child experienced any recent illnesses or health concers?',
                  _childHealthSelectedOption3, (bool? value) {
                setState(() {
                  _childHealthSelectedOption3 = value;
                });
              }),
              HealthPromoterQuizState().GenerateQuestionWidget(
                'Is the child breastfed, formula-fed or both?',
                'Kindly select',
                _childHealthQuizOptions2,
                _childHealthSelectedOption5,
                (newValue) {
                  setState(() {
                    _childHealthSelectedOption5 = newValue;
                  });
                },
              ),
              HealthPromoterQuizState().BuildYesNoQuiz(
                  "Are there any known allergies or intolerances in the child's diet?",
                  _childHealthSelectedOption4, (bool? value) {
                setState(() {
                  _childHealthSelectedOption4 = value;
                });
              }),
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomNavBar(
            screen: PreventiveMedicineOne(),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PreventiveMedicineOne()));
            })
    );
  }
}
