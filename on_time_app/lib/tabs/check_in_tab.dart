import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_time_app/utils/gmap.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

class CheckInTab extends StatefulWidget {
  static const title = 'Check in';
  static const androidIcon = Icon(Icons.location_on);
  static const iosIcon = Icon(CupertinoIcons.location_solid);

  final String userMail;

  CheckInTab(this.userMail);

  @override
  State<StatefulWidget> createState() => _CheckInTabState(userMail);
}

class _CheckInTabState extends State<CheckInTab> {
  String userMail;
  CheckInRecordsApi _recordsApi;
  bool _recordDisabled;
  GMap gmap;

  _CheckInTabState(this.userMail) {
    _recordsApi = new CheckInRecordsApi();
    _recordDisabled = false;
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    double length = cons.maxWidth * 0.75;
    double marginTop = cons.maxHeight * 0.05;
    double columnH = cons.maxHeight - length - marginTop;
    gmap = GMap(length: length);

    return Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        padding: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
        child: Center(
            child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Container(width: length, height: length, child: gmap)),
          Padding(
              padding: EdgeInsets.fromLTRB(0, columnH * 0.05, 0, 0),
              child: Column(
                children: <Widget>[
                  CustomIconButton(
                      height: 42,
                      width: 42,
                      icon: Icons.gps_fixed,
                      onPressed: () =>
                          gmap.getCurrentLocation().then(_registerCheckIn)),
                  Padding(
                      padding: EdgeInsets.only(top: columnH * 0.1),
                      child: checkInButton())
                ],
              ))
        ])));
  }

  _recordLocation() {
    if (!_recordDisabled) {
      gmap.getCurrentLocation().then((l) => {
        //_recordsApi.registerCheckin(email, info, datetime);
      });
    }
  }

  Widget checkInButton() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return Column(children: <Widget>[
          Text('Confirm that the GPS signal is correct'),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blueAccent,
              splashColor: Colors.blueAccent.shade700,
              onPressed: () => _recordLocation(),
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
              onPressed: () => _recordLocation(),
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

  _registerCheckIn(LatLng l) {
    if (l != null) {}
  }
}
