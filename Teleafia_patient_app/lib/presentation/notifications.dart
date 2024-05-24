import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class HealthClientNotifications extends StatelessWidget {
  final String message;

  HealthClientNotifications({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Notifications(message: message,);
  }
}



class Notifications extends StatefulWidget {
  final String message;

  Notifications({required this.message});

  @override
  _NotificationsState createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final Color background = Color(0XFFFCF4F4);
  final Color dark_maroon = Color(0XFF850808);
  final Color maroon = Color(0XFFC00100);

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSent: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    Future.delayed(Duration(seconds: 1), () {
      ChatMessage receivedMessage = ChatMessage(
        text: 'Received: $text',
        isSent: false,
      );
      setState(() {
        _messages.insert(0, receivedMessage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: <Widget>[
          HealthClientHeader(heading: 'Notifications'),

          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(20.0),

            child: Column(
              children: [
                SizedBox(width: 5),
                Text('${widget.message}', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) {
                return ListTile(
                  title: Text(
                    _messages[index].text,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '${_messages[index].time.hour}:${_messages[index].time.minute}',
                  ),
                  tileColor:
                  _messages[index].isSent ? Colors.grey[300] : Colors.blue,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: maroon, // Set your desired border color
                width: 1.0, // Set the border width
              ),
            ),
            child: _buildTextComposer(),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: const Color(0xFFc00100)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                color: Colors.white,
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a message',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatefulWidget {
  final String text;
  final bool isSent;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isSent,
    DateTime? time,
  }) : this.time = time ?? DateTime.now();

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
        widget.isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: widget.isSent
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                widget.isSent
                    ? Text('Sender',
                    style: Theme.of(context).textTheme.subtitle1)
                    : Text('Receiver',
                    style: Theme.of(context).textTheme.subtitle1),
                Container(
                  decoration: BoxDecoration(
                    color: widget.isSent
                        ? const Color(0xFFffffff)
                        : Colors.grey[200],
                    border: Border.all(color: const Color(0xFFc00100)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.isSent ? 15.0 : 0),
                      topRight: Radius.circular(widget.isSent ? 0 : 15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    left: widget.isSent ? 10.0 : 0,
                    right: widget.isSent ? 0 : 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(widget.text),
                      SizedBox(height: 5.0),
                      Text(
                        '${widget.time.hour}:${widget.time.minute}',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
