import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:teleafia_patient/presentation/prescription_file.dart';

import '../Bloc/prescriptionbloc/prescription_bloc.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  Color maroon = Color(0xFF982B15);
  Color background = Color(0xFFFCF4F4);
  Color darkmaroon = Color(0xFF850808);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrescriptionBloc(),
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: Text('Prescription',
            style: TextStyle(
              fontFamily: 'Audowide',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<PrescriptionBloc, PrescriptionState>(
          builder: (context, state) {
            if (state is PrescriptionInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ImagePickedState) {
              return Center(child: Image.file(state.imageFile));
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/presc.jpg',
                      fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 60.0,),
                    Container(
                      child: Text(
                        'Already have your prescribed medicine by your doctor?'
                            ' Please upload your prescription photo here',
                        style: TextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            color: maroon,
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  'jpg',
                                  'png',
                                  'pdf'
                                ], // Specify the file types you want to allow
                              );

                              if (result != null) {
                                PlatformFile file = result.files.first;
                                if (file.path != null) {
                                  File selectedImage = File(file.path!);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Upload(imageFile: selectedImage)),);
                                }
                              }
                              BlocProvider.of<PrescriptionBloc>(context).add(PickImageEvent());
                            },
                          ),
                          Text('Upload your prescription',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
