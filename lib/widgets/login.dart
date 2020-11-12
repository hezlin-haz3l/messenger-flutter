import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'reset.dart';
import 'namelist.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // every form must have controller
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("My Chat App"),
              TextField(
                controller: emailTextController,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'Your e-mail',
                ),
              ),
              TextField(
                controller: passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'Your password',
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                color: Colors.lightGreenAccent,
                onPressed: () async {
                  var email = emailTextController.text;
                  var password = passwordTextController.text;
                  User user = (await _auth.signInWithEmailAndPassword(
                      email: email.toString().trim(), password: password))
                      .user;
                  if (user != null) {
                    print("Succesfully logged in");
                  } else {
                    print("Something is wrong!");
                  }

                  // Navigator.push(context,
                  //    MaterialPageRoute(builder: (context) => NameListPage()));
                },
              ),
              FlatButton(
                child: Text("No account? Signup now"),
                //color: Colors.purpleAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              ),
              FlatButton(
                child: Text("Forgot password"),
                //color: Colors.purpleAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResetPage()));
                },
              ),
            ],
          ),
        ));
  }
}
