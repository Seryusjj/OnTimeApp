import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/home_widget.dart';

class LogInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInPageState();
  }
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.blue.shade800,
                      size: 100,
                    ),
                  ),
                  TextField(decoration: InputDecoration(labelText: "Email")),
                  TextField(decoration: InputDecoration(labelText: "Password"), obscureText: true),
                  RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      splashColor: Colors.blueAccent.shade700,
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeWidget())),
                      child: Text("Log in"))
                ]))));
  }
}
