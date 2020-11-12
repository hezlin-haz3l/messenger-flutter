import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  var emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("My Chat App"),
              TextField(
                controller: emailTextEditingController,
                decoration: InputDecoration(hintText: "Enter your email"),
              ),
              FlatButton(
                child: Text("Forgot Password"),
                color: Colors.lightGreenAccent,
                onPressed: () async {
                  await _auth.sendPasswordResetEmail(email: emailTextEditingController.text.toString().trim());
                  print ("Reset email successfully sent!");

                 // _showCompleteDialog() {
                    /* showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                          title: new Text("Are you sure to reset your password?"),
                          content: new Text("Your password has been reset. Please check your email"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK!'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));*/
                  },
               // },
              ),
            ],
          ),
        ));
  }
}
