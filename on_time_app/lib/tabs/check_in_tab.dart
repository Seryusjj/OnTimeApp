import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:on_time_app/utils/gmap.dart';
import 'package:on_time_app/utils/widgets.dart';

import 'check_in_logic.dart';

class CheckInTab extends StatefulWidget {
  static const title = 'Check in';
  static const androidIcon = Icon(Icons.location_on);
  static const iosIcon = Icon(CupertinoIcons.location_solid);

  final String userMail;

  CheckInTab(this.userMail);

  @override
  State<StatefulWidget> createState() => _CheckInTabState(userMail);
}

class _CheckInTabState extends CheckInLogic<CheckInTab> {
  String userMail;
  final _key = GlobalKey<GMapState>();


  _CheckInTabState(this.userMail) : super(userMail);

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    double length = cons.maxWidth * 0.75;
    double marginTop = cons.maxHeight * 0.05;
    double columnH = cons.maxHeight - length - marginTop;

    return Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        padding: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
        child: Center(
            child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Container(
                  width: length,
                  height: length,
                  child: GMap(key: _key, length: length))),
          Padding(
              padding: EdgeInsets.fromLTRB(0, columnH * 0.05, 0, 0),
              child: Column(
                children: <Widget>[
                  CustomIconButton(
                      height: 42,
                      width: 42,
                      icon: Icons.gps_fixed,
                      onPressed: () => getInfo()),
                  Padding(
                      padding: EdgeInsets.only(top: columnH * 0.1),
                      child: checkInButton(length))
                ],
              ))
        ])));
  }

  @override
  Future<Map<String, dynamic>> getInfo() async {
    var l = await _key.currentState.getCurrentLocation();

    Map json = Map<String, dynamic>();
    json['userEmail'] = userMail;
    json['info'] = 'lat: ${l.latitude}, long: ${l.longitude}';
    json['location'] = true;
    json['utcDateTime'] = null;
    json['endDay'] = false;
    return json;
  }

  Widget checkInButton(double width) {
    if (endDay) {
      return Card(
          elevation: 1.5,
          margin: EdgeInsets.fromLTRB(width*0.2, 12,width*0.2, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: SizedBox(
              height: width * 0.2,
              child: Center(
                  child: Text('Worked time today: ' +
                      workedHours.toString() +
                      ':' +
                      workedMinutes.toString()))));
    }
    if (recordDisabled) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return Container(
              padding: EdgeInsets.all(5), child: CircularProgressIndicator());
        case TargetPlatform.iOS:
          return Container(child: CupertinoActivityIndicator());
        default:
          return Container();
      }
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return Column(children: <Widget>[
            Text('Confirm that the GPS signal is correct'),
            RaisedButton(
                textColor: Colors.white,
                color: Colors.blueAccent,
                splashColor: Colors.blueAccent.shade700,
                onPressed: () => recordLocation(),
                child: Text("Record"))
          ]);

        case TargetPlatform.iOS:
          return Column(children: <Widget>[
            Text('Confirm that the GPS signal is correct',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
            CupertinoButton(
                onPressed: () => recordLocation(),
                color: Colors.blueAccent,
                child: Text("Record"))
          ]);
        default:
          return Container();
      }
    }
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CheckInTab.title),
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
