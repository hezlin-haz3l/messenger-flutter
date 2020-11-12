import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'namelist.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // every form must have controller
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("My Chat App"),
              TextField(
                controller:
                    emailTextController, // every form must have controller
                decoration: InputDecoration(hintText: 'Your e-mail'),
              ),
              TextField(
                controller:
                    passwordTextController, // every form must have controller
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Your password',
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                color: Colors.lightGreenAccent,
                onPressed: () async {
                  var email = emailTextController.text;
                  var password = passwordTextController.text;
                  User user = (await _auth.createUserWithEmailAndPassword(
                          email: email.toString().trim(), password: password))
                      .user;
                  if (user != null) {
                    print("Succesfully logged in");
                  } else {
                    print("Something is wrong!");
                  }
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => NameListPage()));
                },
              ),
            ],
          ),
        ));
  }
}
