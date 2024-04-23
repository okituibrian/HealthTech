import 'package:flutter/material.dart';
import 'package:teleafia_chp_app/presentation/wash.dart';
import 'package:teleafia_chp_app/shared/bottom_nav.dart';
import 'package:teleafia_chp_app/shared/header.dart';
import 'package:teleafia_chp_app/shared/health_promoter_quiz.dart';
import 'package:teleafia_chp_app/models.dart';

class ChildHealth extends StatefulWidget {
  final CombinedFormData formData;

  const ChildHealth({Key? key, required this.formData}) : super(key: key);

  @override
  ChildHealthState createState() => ChildHealthState();
}

class ChildHealthState extends State<ChildHealth> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);

  String? _childHealthSelectedOption1;
  String? _childHealthSelectedOption2;
  String? _childHealthSelectedOption3;
  String? _childHealthSelectedOption4;
  List<String> _childHealthQuizOptions1 = [
    'Green',
    'Yellow',
    'Red',
    'Not Done'
  ];
  List<String> _childHealthQuizOptions2 = ['Breastfed', 'Formula-fed', 'Both'];

  String? _childHealthSelectedOption5;
  String? _childHealthSelectedOption6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(title: 'Child Health Status'),
              HealthPromoterQuizState().Headline('For Children Below 5 Years of Age'),
              /*HealthPromoterQuizState().BuildYesNoQuiz(
                "Is the child's immunization status up to date?",
                _childHealthSelectedOption1,
                    (String? value) {
                  setState(() {
                    _childHealthSelectedOption1 = value;
                    widget.formData.childHealthStatusData.immunizationStatusUpToDate = value ?? '';
                  });
                },
              ),*/
              HealthPromoterQuizState().GenerateQuestionWidget(
                "What is the child's MUAC (Mid-Upper Arm Circumference) score?",
                'Kindly select',
                _childHealthQuizOptions1,
                _childHealthSelectedOption5,
                    (newValue) {
                  setState(() {
                    _childHealthSelectedOption5 = newValue;
                   // widget.formData.childHealthStatusData.muacScore = newValue ?? '';
                  });
                },
              ),
             /* HealthPromoterQuizState().BuildYesNoQuiz(
                'If the two conditions above are not met, would you be willing to provide consent for medical referall if necessary?',
                _childHealthSelectedOption2,
                    (String? value) {
                  setState(() {
                    _childHealthSelectedOption2 = value;
                    widget.formData.childHealthStatusData.consentForRefferal = value ?? '';
                  });
                },
              ),*/
              HealthPromoterQuizState().FormRedirectLink(
                'If YES kindly proceed to fill the ',
                'MEDICAL REPORTING FORM',
                    () {},
              ),
              /*HealthPromoterQuizState().BuildYesNoQuiz(
                'Has the child experienced any recent illnesses or health concers?',
                _childHealthSelectedOption3,
                    (String? value) {
                  setState(() {
                    _childHealthSelectedOption3 = value;
                    widget.formData.childHealthStatusData.illnessExperiencedRecently = value ?? '';
                  });
                },
              ),*/
              HealthPromoterQuizState().GenerateQuestionWidget(
                'Is the child breastfed, formula-fed or both?',
                'Kindly select',
                _childHealthQuizOptions2,
                _childHealthSelectedOption6,
                    (newValue) {
                  setState(() {
                    _childHealthSelectedOption6 = newValue;
                    widget.formData.childHealthStatusData.feedingMethod = newValue ?? '';
                  });
                },
              ),
             /* HealthPromoterQuizState().BuildYesNoQuiz(
                "Are there any known allergies or intolerances in the child's diet?",
                _*//*childHealthSelectedOption4,
                    (String? value) {
                  setState(() {
                    _childHealthSelectedOption4 = value;
                    widget.formData.childHealthStatusData.allergiesOrIntolerances = value ?? '';
                  });
                },*//*
              ),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        Screen: Wash(formData: widget.formData),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Wash(formData: widget.formData),
            ),
          );
        },
      ),
    );
  }
}
