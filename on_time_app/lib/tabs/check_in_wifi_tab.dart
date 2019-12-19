import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:on_time_app/utils/gmap.dart';
import 'package:on_time_app/utils/widgets.dart';

import 'check_in_logic.dart';

class CheckInWifiTab extends StatefulWidget {
  static const title = 'Check in';
  static const androidIcon = Icon(Icons.location_on);
  static const iosIcon = Icon(CupertinoIcons.location_solid);

  final String userMail;

  CheckInWifiTab(this.userMail);

  @override
  State<StatefulWidget> createState() => _CheckInWifiTabState(userMail);
}

class _CheckInWifiTabState extends CheckInLogic<CheckInWifiTab> {
  String userMail;
  String wifiInfo;

  _CheckInWifiTabState(this.userMail) : super(userMail){
    wifiInfo = 'None';
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    double length = cons.maxWidth * 0.55;
    double marginTop = cons.maxHeight * 0.05;
    double columnH = cons.maxHeight - length - marginTop;

    return Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        padding: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
        child: Center(
            child: Column(children: <Widget>[
          Card(
              elevation: 1.5,
              margin: EdgeInsets.fromLTRB(length * 0.3, length * 0.1, length * 0.3, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: SizedBox(
                  height: length,
                  child: Column(children: <Widget>[
                    Center(
                        child: Icon(Icons.wifi,
                            size: length*0.8, color: Colors.black)),
                    Padding(padding: EdgeInsets.fromLTRB(0, length*0.05, 0, 0)),
                    Center(child: Text('Wifi: ${wifiInfo}'))
                  ]))),
          Padding(
              padding: EdgeInsets.fromLTRB(0, columnH * 0.05, 0, 0),
              child: Column(
                children: <Widget>[
                  CustomIconButton(
                      height: 42,
                      width: 42,
                      icon: Icons.refresh,
                      onPressed: () => getInfo()),
                  Padding(
                      padding: EdgeInsets.only(top: columnH * 0.20),
                      child: checkInButton(length))
                ],
              ))
        ])));
  }

  @override
  Future<Map<String, dynamic>> getInfo() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    var info = '';
    if (connectivityResult == ConnectivityResult.mobile) {
      info = 'None';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      var wifiBSSID = await (Connectivity().getWifiBSSID());
      var wifiIP = await (Connectivity().getWifiIP());// network
      var wifiName = await (Connectivity().getWifiName());// wifi network
      info = wifiName;
    }
    if (wifiInfo != info) {
      this.setState(()=> wifiInfo = info);
    }

    Map json = Map<String, dynamic>();
    json['userEmail'] = userMail;
    json['info'] = 'wifi: ${info}';
    json['location'] = false;
    json['utcDateTime'] = null;
    json['endDay'] = false;
    return json;
  }

  Widget checkInButton(double width) {
    if (endDay) {
      return Card(
          elevation: 1.5,
          margin: EdgeInsets.fromLTRB(width * 0.2, 12, width * 0.2, 0),
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
            Text('Confirm that the Wifi information is correct'),
            RaisedButton(
                textColor: Colors.white,
                color: Colors.blueAccent,
                splashColor: Colors.blueAccent.shade700,
                onPressed: () => recordLocation(),
                child: Text("Record"))
          ]);

        case TargetPlatform.iOS:
          return Column(children: <Widget>[
            Text('Confirm that the Wifi information is correct',
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
