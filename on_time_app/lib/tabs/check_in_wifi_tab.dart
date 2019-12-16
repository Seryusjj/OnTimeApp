import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:on_time_app/utils/gmap.dart';
import 'package:on_time_app/utils/widgets.dart';

class CheckInWifiTab extends StatefulWidget {
  static const title = 'Check in';
  static const androidIcon = Icon(Icons.location_on);
  static const iosIcon = Icon(CupertinoIcons.location_solid);

  final String userMail;

  CheckInWifiTab(this.userMail);

  @override
  State<StatefulWidget> createState() => _CheckInWifiTabState();
}

class _CheckInWifiTabState extends State<CheckInWifiTab> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    double length = cons.maxWidth * 0.35;
    double marginTop = cons.maxHeight * 0.05;
    double columnH = cons.maxHeight - length - marginTop;

    return Container(
        decoration: BoxDecoration(color: Colors.transparent),
        padding: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
        child: Center(
            child: Column(children: <Widget>[
          Container(
              child: Icon(Icons.wifi, size: length,),
              width: length,
              height: length),
          Text('Currentlly conected to wifi: mywifiname'),
          Padding(
              padding: EdgeInsets.fromLTRB(0, columnH * 0.1, 0, 0),
              child: Column(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.blueAccent,
                      tooltip: 'Center location to your position',
                      focusColor: Colors.blueAccent.shade700,
                      hoverColor: Colors.amber,
                      splashColor: Colors.white,
                      onPressed: () => {}),
                  Padding(
                      padding: EdgeInsets.only(top: columnH * 0.1),
                      child: checkInButton())
                ],
              ))
        ])));
  }

  Widget checkInButton() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return Column(children: <Widget>[
          Text('Confirm that the wifi network is correct'),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blueAccent,
              splashColor: Colors.blueAccent.shade700,
              onPressed: () => {},
              child: Text("Record"))
        ]);

      case TargetPlatform.iOS:
        return Column(children: <Widget>[
          Text('Confirm that the wifi network is correct',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
          CupertinoButton(
              onPressed: () => {},
              color: Colors.blueAccent,
              child: Text("Record"))
        ]);
      default:
        return Container();
    }
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CheckInWifiTab.title),
        ),
        body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)));
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: Scaffold(
            body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder))));
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
