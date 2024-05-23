import 'dart:io';
import 'package:flutter/material.dart';
import 'package:teleafia_patient/presentation/submit_presc.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class Upload extends StatefulWidget {
  final File imageFile;
  const Upload({Key? key, required this.imageFile}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}
class _UploadState extends State<Upload> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);

  Future<void> upload(File file) async {

      var request = http.MultipartRequest('POST',
          Uri.parse(
              'https://a574-102-210-244-74.ngrok-free.app/api/prescription/uploadprescriptionimage/1234'));
      request.files.add(await http.MultipartFile.fromPath(
        'prescription-image',
        widget.imageFile.path,
        filename: path.basename(widget.imageFile.path),
      ));
      var response = await request.send();
      if (response.statusCode == 200) {
        print("File uploaded successfully");
      } else {
        print("File upload failed");
      }
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text('Prescription file',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please confirm if you have picked the right file'
            ' that contains your prescription before you upload',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              SizedBox(height: 20.0),
              Image.file(widget.imageFile),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextButton(onPressed: () async {
                  await upload(widget.imageFile);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Submitpresc()),);

                },
                  style: TextButton.styleFrom(backgroundColor: maroon,
                    minimumSize: Size(150, 40),),
                  child: Text('UPLOAD',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),),),
            ],
          ),
        ),
      ),
    );
  }
}
