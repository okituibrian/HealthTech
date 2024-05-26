import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';

class HealClientMessages extends StatelessWidget {
  HealClientMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Notifications();
  }
}

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final Color background = const Color(0XFFFCF4F4);
  final Color darkMaroon = const Color(0XFF850808);
  final Color maroon = const Color(0XFFC00100);

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSent: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    Future.delayed(const Duration(seconds: 1), () {
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
          HealthClientHeader(heading: 'Chats'),
          const SizedBox(height: 5),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) {
                return ListTile(
                  title: Text(
                    _messages[index].text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '${_messages[index].time.hour}:${_messages[index].time.minute}',
                  ),
                  tileColor:
                  _messages[index].isSent ? Colors.grey[300] : Colors.blue,
                  contentPadding: const EdgeInsets.symmetric(
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
                color: maroon,
                width: 1.0,
              ),
            ),
            child: _buildTextComposer(),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Color(0xFFc00100)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                color: Colors.white,
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Send a message',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSent;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isSent,
    DateTime? time,
  }) : this.time = time ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
        isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment:
              isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                isSent
                    ? Text('Sender', style: Theme.of(context).textTheme.subtitle1)
                    : Text('Receiver', style: Theme.of(context).textTheme.subtitle1),
                Container(
                  decoration: BoxDecoration(
                    color: isSent ? const Color(0xFFffffff) : Colors.grey[200],
                    border: Border.all(color: const Color(0xFFc00100)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSent ? 15.0 : 0),
                      topRight: Radius.circular(isSent ? 0 : 15.0),
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    left: isSent ? 10.0 : 0,
                    right: isSent ? 0 : 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(text),
                      const SizedBox(height: 5.0),
                      Text(
                        '${time.hour}:${time.minute}',
                        style: const TextStyle(fontSize: 10.0),
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
