import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List messages = [
    {"From": "Hezlin", "Message": "Hello", "Date": "11/11 20:30"},
    {"From": "Yani", "Message": "Yoo", "Date": "11/11 20:30"},
    {"From": "Zalifah", "Message": "Operation", "Date": "11/11 20:30"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat Page"),
        ),
        body: Column(
          children: [
            Row(children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(hintText: "Enter Message"),
              )),
              FlatButton(
                color: Colors.lightGreenAccent,
                onPressed: () {},
                child: Text("Send"),
              )
            ]),
            Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text(messages[position]["From"]),
                        subtitle: Text(messages[position]["Message"]));
                  }),
            )
          ],
        ));
  }
}
