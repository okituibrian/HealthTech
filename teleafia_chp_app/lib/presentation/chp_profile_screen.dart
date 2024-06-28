import 'dart:io'; // Import dart:io for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class HealthPromoterProfile extends StatefulWidget {
  final XFile? imageFile;

  const HealthPromoterProfile({Key? key, this.imageFile}) : super(key: key);
  @override
  _HealthPromoterProfileState createState() => _HealthPromoterProfileState();
}

class _HealthPromoterProfileState extends State<HealthPromoterProfile> {
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);
  XFile? _imageFile;
  bool pushNotification = false; // Initial toggle state
  bool darkMode = false; // Initial toggle state

  Future<void> _pickImage(ImageSource source) async {
    XFile? selected = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


            GestureDetector(
              onTap: () => _pickImage(ImageSource.gallery),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageFile != null
                    ? FileImage(File(_imageFile!.path))
                    : AssetImage('assets/default_profile.PNG') as ImageProvider,
              ),
            ),
            SizedBox(height: 10),




               Column(
                children: [

                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    leading: Text(
                      'Push notifications',
                      style: TextStyle(
                        color: Color(0XFF850808), // Change color as needed
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    trailing: IconButton(
                      icon: pushNotification
                          ? Icon(
                        Icons.toggle_on_sharp,
                        color: maroon,
                      )
                          : Icon(
                        Icons.toggle_off_sharp,
                        color: Colors.grey,
                      ),
                      iconSize: 40,
                      color: maroon,
                      onPressed: () {
                        // Add your desired functionality here
                        setState(() {
                          pushNotification = !pushNotification;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    leading: Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: Color(0XFF850808), // Change color as needed
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    trailing: IconButton(
                      icon: darkMode
                          ? Icon(
                        Icons.toggle_on_sharp,
                        color: maroon,
                      )
                          : Icon(
                        Icons.toggle_off_sharp,
                        color: Colors.grey,
                      ),
                      iconSize: 40,
                      onPressed: () {
                        // Add your desired functionality here
                        setState(() {
                          darkMode = !darkMode;
                        });
                      },
                    ),
                  ),
                ],
              ),




          ],
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    _imageFile = widget.imageFile;
  }
}
