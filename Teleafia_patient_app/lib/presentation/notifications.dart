import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class HealthClientNotifications extends StatelessWidget {
  final List<String> messages; // Change type to List<String>

  HealthClientNotifications({
    required this.messages, // Update constructor parameter
  });

  @override
  Widget build(BuildContext context) {
    return Notifications(messages: messages);
  }
}

class Notifications extends StatefulWidget {
  final List<String> messages; // Change type to List<String>

  Notifications({required this.messages}); // Update constructor parameter

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final Color background = Color(0XFFFCF4F4);
  final Color dark_maroon = Color(0XFF850808);
  final Color maroon = Color(0XFFC00100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: <Widget>[
          HealthClientHeader(heading: 'Notifications'),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: widget.messages.length, // Use messages from widget
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
                  child: _buildMessageText(widget.messages[index]), // Use messages from widget
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

  Widget _buildMessageText(String text) {
    final RegExp urlRegExp = RegExp(
      r'((https?:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+)|((https?:\/\/)?(www\.)?[a-zA-Z0-9_\-]+\.([a-zA-Z]{2,5})(\/[a-zA-Z0-9_\-]+)*)',
      caseSensitive: false,
    );

    final List<TextSpan> spans = [];
    final List<RegExpMatch> matches = urlRegExp.allMatches(text).toList();

    if (matches.isEmpty) {
      return Text(text, style: TextStyle(fontSize: 16));
    }

    int start = 0;

    for (final RegExpMatch match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }

      final String url = match.group(0)!;

      spans.add(
        TextSpan(
          text: url,
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = () => _launchURL(url),
        ),
      );

      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return RichText(
      text: TextSpan(style: TextStyle(fontSize: 16, color: Colors.black), children: spans),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
