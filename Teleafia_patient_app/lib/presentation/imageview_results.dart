import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class HealthClientImageviewResults extends StatelessWidget {
  final List<String> images; // Change type to List<String>

  HealthClientImageviewResults({
    required this.images, // Update constructor parameter
  });

  @override
  Widget build(BuildContext context) {
    return ImageviewResults(images: images);
  }
}

class ImageviewResults extends StatefulWidget {
  final List<String> images; // Change type to List<String>

  ImageviewResults({required this.images}); // Update constructor parameter

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<ImageviewResults> {
  final Color background = Color(0XFFFCF4F4);
  final Color dark_maroon = Color(0XFF850808);
  final Color maroon = Color(0XFFC00100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: <Widget>[
          HealthClientHeader(heading: 'Image results'),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: widget.images.length, // Use messages from widget
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  // Use messages from widget
                );
              },
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

}

class _buildMessageText {
}