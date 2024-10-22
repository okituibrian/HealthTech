import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HealthPromoterQuiz extends StatefulWidget {
  const HealthPromoterQuiz({Key? key}) : super(key: key);

  @override
  HealthPromoterQuizState createState() => HealthPromoterQuizState();
}

class HealthPromoterQuizState extends State<HealthPromoterQuiz> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  Widget Headline(String headline) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headline,
                style: TextStyle(
                  color: dark_maroon,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget GenerateTextfield(String hintText) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        margin: EdgeInsets.all(5),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: maroon),
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildYesNoQuiz(
      String question, bool? selectedOption, ValueChanged<bool?> onChanged) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child:
                Text(question, style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Yes'),
            Radio<bool>(
              value: true,
              groupValue: selectedOption,
              onChanged: onChanged,
              activeColor: maroon,
            ),
            Text('No'),
            Radio<bool>(
              value: false,
              groupValue: selectedOption,
              onChanged: onChanged,
              activeColor: maroon,
            ),
          ],
        ),
      ],
    );
  }

  Widget GenerateQuestionWidget1(
      String question,
      String hint,
      List<String> options,
      String? selectedOption,
      Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(question, style: TextStyle(fontWeight: FontWeight.w600)),
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
      ),
    );
  }

  Widget GenerateQuestionWidget(
    String question,
    String hint,
    List<String> options,
    String? selectedOption,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(question, style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: maroon),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    controller: TextEditingController(text: selectedOption),
                    readOnly: true,
                  ),
                ),
                SizedBox(width: 10.0),
                DropdownButton<String>(
                  value: selectedOption,
                  onChanged: onChanged, // Pass onChanged callback here
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down, color: maroon),
                  underline: SizedBox(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget GenerateTextfieldDropdownWidget(String hint, List<String> options,
      String? selectedOption, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
      ),
    );
  }

  Widget GenerateTextfieldWithOptions(
    String hint,
    List<String> options,
    List<String?> selectedOptions,
    Function(String?) onChanged,
  ) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: null,
                  onChanged: onChanged,
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Checkbox(
                            value: selectedOptions.contains(value),
                            onChanged: (_) {
                              setState(() {
                                if (selectedOptions.contains(value)) {
                                  selectedOptions.remove(value);
                                } else {
                                  selectedOptions.add(value);
                                }
                              });
                              onChanged(value);
                            },
                            activeColor: maroon,
                          ),
                          Text(
                            value,
                            style: TextStyle(color: maroon),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  style: TextStyle(color: maroon),
                  decoration: InputDecoration(
                    hintText: selectedOptions.isNotEmpty
                        ? selectedOptions.join(', ')
                        : hint,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: maroon),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: maroon),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: maroon),
                    ),
                  ),
                  dropdownColor: background,
                  icon: Icon(Icons.menu, color: maroon),
                  isExpanded: true,
                  iconSize: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to generate question and options
  Widget GenerateQuestionWithOptions(
    String question,
    String hint,
    List<String> options,
    List<String?> selectedOptions,
    Function(String?) onChanged,
  ) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: null,
                  onChanged: onChanged,
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Checkbox(
                            value: selectedOptions.contains(value),
                            onChanged: (_) {
                              setState(() {
                                if (selectedOptions.contains(value)) {
                                  selectedOptions.remove(value);
                                } else {
                                  selectedOptions.add(value);
                                }
                              });
                              onChanged(value);
                            },
                            activeColor: maroon,
                          ),
                          Text(
                            value,
                            style: TextStyle(color: maroon),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  style: TextStyle(color: maroon),
                  decoration: InputDecoration(
                    hintText: selectedOptions.isNotEmpty
                        ? selectedOptions.join(', ')
                        : hint,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: maroon),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: maroon),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: maroon),
                    ),
                  ),
                  dropdownColor: background,
                  icon: Icon(Icons.menu, color: maroon),
                  isExpanded: true,
                  iconSize: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget FormRedirectLink(
      String promptText, String underlinedText, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(promptText, style: TextStyle(fontWeight: FontWeight.w600)),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                underlinedText,
                textAlign: TextAlign.right,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  decorationColor: dark_maroon,
                  color: dark_maroon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildHealthPromoterQuiz();
  }

  Widget buildHealthPromoterQuiz() {
    // Return each function individually
    return Container(); // Placeholder, replace with your actual UI if needed
  }
}

// Function that returns an instance of HealthPromoterQuiz
Widget buildHealthPromoterQuizWidget() {
  return HealthPromoterQuiz();
}

// Function that returns the headline function
Widget Function(String) getHeadline() {
  return (String headline) {
    return HealthPromoterQuizState().Headline(headline);
  };
}

Widget Function(String) getGenerateTextfield() {
  return (String hintText) {
    return HealthPromoterQuizState().GenerateTextfield(hintText);
  };
}

Widget Function(String, List<String>, String?, Function(String?))
    getGenerateTextfieldDropdownWidget() {
  return (String hint, List<String> options, String? selectedOption,
      Function(String?) onChanged) {
    return HealthPromoterQuizState().GenerateTextfieldDropdownWidget(
        hint, options, selectedOption, onChanged);
  };
}

// Function that returns the buildYesNoQuiz function
Widget Function(String, bool?, ValueChanged<bool?>) getBuildYesNoQuiz() {
  return (String question, bool? selectedOption,
      ValueChanged<bool?> onChanged) {
    return HealthPromoterQuizState()
        .BuildYesNoQuiz(question, selectedOption, onChanged);
  };
}

// Function that returns the generateQuestionWidget function
Widget Function(String, String, List<String>, String?, Function(String?))
    getGenerateQuestionWidget() {
  return (String question, String hint, List<String> options,
      String? selectedOption, Function(String?) onChanged) {
    return HealthPromoterQuizState().GenerateQuestionWidget(
        question, hint, options, selectedOption, onChanged);
  };
}

Widget Function(String, List<String>, List<String>, Function(String?))
    getGenerateTextfieldWithOptions() {
  return (String hint, List<String> options, List<String> selectedOptions,
      Function(String?) onChanged) {
    return HealthPromoterQuizState().GenerateTextfieldWithOptions(
        hint, options, selectedOptions, onChanged);
  };
}

// Function that returns the GenerateCheckBoxQuestionWidget function
Widget Function(String, String, List<String>, List<String>, Function(String?))
    getGenerateQuestionWithOptions() {
  return (String question, String hint, List<String> options,
      List<String> selectedOptions, Function(String?) onChanged) {
    return HealthPromoterQuizState().GenerateQuestionWithOptions(
        question, hint, options, selectedOptions, onChanged);
  };
}

// Function that returns the formRedirectLink function
Widget Function(String, String, VoidCallback) getFormRedirectLink() {
  return (String promptText, String underlinedText, VoidCallback onTap) {
    return HealthPromoterQuizState()
        .FormRedirectLink(promptText, underlinedText, onTap);
  };
}
