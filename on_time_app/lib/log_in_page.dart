import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_time_app/utils/config.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

import 'home/home_widget.dart';

class LogInPage extends StatefulWidget {


  LogInPage();

  @override
  State<StatefulWidget> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final userNameController = TextEditingController();
  final userPassController = TextEditingController();

  IdentityApi _identityApi;
  bool _loginDisabled;

  _LogInPageState() {
    // create api
    _loginDisabled = false;
    _identityApi = new IdentityApi();
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

  Future<void> logIn(String username, String password) async {
    if (!_loginDisabled) {
      await Config.initAll();
      setState(() {
        _loginDisabled = true;
      });
      Map<String, String> json = Map<String, String>();

      // do nothing on timeout
      await _identityApi
          .apiV1IdentityInitPost()
          .timeout(Duration(seconds: 10), onTimeout: () => {});

      json['email'] = userNameController.text;
      json['password'] = userPassController.text;
      // if this one fails then show errors
      var res = await _identityApi
          .apiV1IdentityLoginPost(body: UserLoginRequest.fromJson(json))
          .timeout(Duration(seconds: 10),
              onTimeout: () => DialogManager.showException(
                  context, "Could not connect to service, please try later"))
          .catchError(
              (e) => DialogManager.showException(context, "Something went wrong on the service call"));

      if (res != null && res.success) {
        defaultApiClient.addDefaultHeader(
            "Authorization", "Bearer " + res.token);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeWidget(userMail: userNameController.text)));
      } else if (res != null) {
        DialogManager.showErrors(context, res.errors);
      }

      setState(() {
        _loginDisabled = false;
      });
    }
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidLoginPage,
      iosBuilder: _buildIosLoginPage,
    );
  }

  Widget _buildIosLoginPage(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        child: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                    child: Column(children: <Widget>[
                      Image(
                          image: AssetImage('images/header.png'),
                          width: 250,
                          height: 160),
                      Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                      CupertinoTextField(
                        placeholder: "Email",
                        controller: userNameController,
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                      CupertinoTextField(
                          placeholder: "Password",
                          obscureText: true,
                          controller: userPassController),
                      Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                      logInButton()
                    ])))));
  }

  Widget _buildAndroidLoginPage(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                    child: Column(children: <Widget>[
                      Image(
                          image: AssetImage('images/header.png'),
                          width: 250,
                          height: 160),
                      TextField(
                        decoration: InputDecoration(labelText: "Email"),
                        controller: userNameController,
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      TextField(
                          decoration: InputDecoration(labelText: "Password"),
                          obscureText: true,
                          controller: userPassController),
                      Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                      logInButton()
                    ])))));
  }

  Widget logInButton() {
    if (_loginDisabled) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return Container(
              padding: EdgeInsets.all(5), child: CircularProgressIndicator());
        case TargetPlatform.iOS:
          return Container(child: CupertinoActivityIndicator());
        default:
          return Container();
      }
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            splashColor: Colors.blueAccent.shade700,
            onPressed: () =>
                logIn(userNameController.text, userPassController.text),
            child: Text("Log in"));

      case TargetPlatform.iOS:
        return CupertinoButton(
            onPressed: () =>
                logIn(userNameController.text, userPassController.text),
            color: Colors.blueAccent,
            child: Text("Log in"));
      default:
        return Container();
    }
  }
}
