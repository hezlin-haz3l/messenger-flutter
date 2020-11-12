import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

class NameListPage extends StatefulWidget {
  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  List users = [
    {"Name": "Hezlin", "Department": "IOC"},
    {"Name": "Yani", "Department": "IT"},
    {"Name": "Zalifah", "Department": "Operation"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name List"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, position) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatPage()));
            },
            title: Text(users[position]["Name"]),
            subtitle: Text(users[position]["Department"]),
            trailing: Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
