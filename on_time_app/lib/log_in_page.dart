import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

import 'home/home_widget.dart';

class LogInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInPageState();
  }
}

class _LogInPageState extends State<LogInPage> {
  final userNameController = TextEditingController();
  final userPassController = TextEditingController();

  IdentityApi ident_api;
  RolesApi role_api;

  _LogInPageState() {
    // create api
    ident_api = new IdentityApi();
    role_api = new RolesApi();
    userNameController.text = "admin@admin.com";
    userPassController.text = "Admin123!";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    userPassController.dispose();
    super.dispose();
  }

  void logIn(String username, String password) {
    Map<String, String> json = Map<String, String>();
    ident_api.apiV1IdentityInitPost().then((v) => {
          json['email'] = userNameController.text,
          json['password'] = userPassController.text,
          ident_api
              .apiV1IdentityLoginPost(body: UserLoginRequest.fromJson(json))
              .then((t) => navigate(t))
        });
  }

  void navigate(AuthResponse t) {
    if (t.success) {
      defaultApiClient.addDefaultHeader("Authorization", "Bearer " + t.token);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeWidget()));
    }
  }

  @override
  Widget build(BuildContext context) {
    //UserLoginRequest req;

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.blue.shade800,
                      size: 100,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Email"),
                    controller: userNameController,
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      controller: userPassController),
                  RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      splashColor: Colors.blueAccent.shade700,
                      onPressed: () => logIn(
                          userNameController.text, userPassController.text),
                      child: Text("Log in"))
                ])))));

  }
}
