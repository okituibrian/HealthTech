import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/textinputformater.dart';

class MedicalServicesFunctions {
  ListTile customListTile({
    required String text,
    required String imagePath,
    required void Function() onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Color(0XFF850808), // Change color as needed
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 15,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
  
}

class MedicalServicesOverview {
  Padding medicalServicesOverview({
    required String overview,
    required void Function() booking,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0XFFc00100)),
              ),
              child: TextFormField(
                readOnly: true,
                initialValue: overview,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: booking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFc00100),
                  minimumSize: Size(70, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Book Appointment',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Quality, Affordable healthcare for all',
              style: TextStyle(
                color: Color(0XFFc00100),
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFields {
  final Color background = Color(0XFFFCF4F4);
  final Color maroon = Color(0XFFC00100);
  Color darkMaron = Color(0XFF850808);

  Widget generateDropdownnWidget(String hint, List<String> options,
      String? selectedOption, Function(String?) onChanged) {
    return Column(
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
              hint: Text(
                hint,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: selectedOption,
              onChanged: onChanged,
              // Pass onChanged callback here
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

  Widget generateQuestionWidget(String question,
      String hint,
      List<String> options,
      String? selectedOption,
      Function(String?) onChanged) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
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
              onChanged: onChanged,
              // Pass onChanged callback here
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

  Widget GenerateTextfield(String hintText, TextEditingController controller, Function(String?)? onSaved, ) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
      border: Border.all(color: Color(0XFFC00100)), // Maroon color
      borderRadius: BorderRadius.circular(4.0),
      color: Colors.white,
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: InputBorder.none,
           hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onSaved: onSaved,
              ),
           );
      }
         }
