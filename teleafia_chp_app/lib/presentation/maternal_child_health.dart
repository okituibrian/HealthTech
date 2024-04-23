import 'package:flutter/material.dart';
import 'package:teleafia_chp_app/presentation/wash.dart';
import 'package:teleafia_chp_app/shared/bottom_nav.dart';
import 'package:teleafia_chp_app/shared/header.dart';
import 'package:teleafia_chp_app/shared/health_promoter_quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaternalAndChildHealth(),
    );
  }
}

class MaternalAndChildHealth extends StatefulWidget {
  const MaternalAndChildHealth({Key? key}) : super(key: key);

  @override
  MaternalAndChildHealthState createState() => MaternalAndChildHealthState();
}

class MaternalAndChildHealthState extends State<MaternalAndChildHealth> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);

  String? _mchSelectedOption1;
  String? _mchSelectedOption2;
  String? _mchSelectedOption3;
  String? _mchSelectedOption4;
  String? _mchSelectedOption5;
  String? _mchSelectedOption6;
  String? _mchSelectedOption7;
  String? _mchSelectedOption8;
  String? _mchSelectedOption9;
  String? _mchSelectedOption10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(title: 'Maternal and Child Health'),

              HealthPromoterQuizState()
                  .Headline('For Females of Reproductive Age'),

              // You can now use the buildYesNoQuiz function directly from the HealthPromoterQuiz file
              HealthPromoterQuizState().BuildYesNoQuiz(
                  "Are you pregnant?", _mchSelectedOption1, (String? value) {
                setState(() {
                  _mchSelectedOption1 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  "If yes: Do you have an MCH handbook?", _mchSelectedOption2,
                  (String? value) {
                setState(() {
                  _mchSelectedOption2 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Have you started ANC (Antenatal Care)?', _mchSelectedOption3,
                  (String? value) {
                setState(() {
                  _mchSelectedOption3 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Is your  ANC visit up to date?', _mchSelectedOption4,
                  (String? value) {
                setState(() {
                  _mchSelectedOption4 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Do you have an integrated Birth Plan (IBP)?',
                  _mchSelectedOption5, (String? value) {
                setState(() {
                  _mchSelectedOption5 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Do you have any pregnancy danger signs?',
                  _mchSelectedOption6, (String? value) {
                setState(() {
                  _mchSelectedOption6 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'If yes, may we have your consent for referral?',
                  _mchSelectedOption7, (String? value) {
                setState(() {
                  _mchSelectedOption7 = value;
                });
              }),




              HealthPromoterQuizState().FormRedirectLink(
                'If YES kindly proceed to fill the ', // Prompt text
                'MEDICAL REPORTING FORM', // Underlined text
                () {},
              ),
              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Are you currently taking any medications or supplements?',
                  _mchSelectedOption8, (String? value) {
                setState(() {
                  _mchSelectedOption8 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Have you experienced any complications during previous pregnancies?',
                  _mchSelectedOption9, (String? value) {
                setState(() {
                  _mchSelectedOption9 = value;
                });
              }),

              HealthPromoterQuizState().BuildYesNoQuiz(
                  'Are you aware of the importance of prenatal vitamins and proper nutrition during pregnancy?',
                  _mchSelectedOption10, (String? value) {
                setState(() {
                  _mchSelectedOption10 = value;
                });
              }),
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomNavBar(
            Screen: Wash(),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Wash()));
            })
    );
  }
}
