import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:on_time_app/utils/widgets.dart';

class CheckInTab extends StatefulWidget {
  static const title = 'Check in';
  static const androidIcon = Icon(Icons.location_on);
  static const iosIcon = Icon(CupertinoIcons.location_solid);

  @override
  State<StatefulWidget> createState() => _CheckInTabState();
}

class _CheckInTabState extends State<CheckInTab> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    double length = cons.maxWidth * 0.75;
    GMap gmap = GMap(length: length);

    return Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        padding: const EdgeInsets.only(top: 15),
        child: Center(
            child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Container(width: length, height: length, child: gmap)),
          Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text('Confirm that the GPS is correct'),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blueAccent,
                          splashColor: Colors.blueAccent.shade700,
                          onPressed: () async => await gmap.getCurrentLocation(),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text("Record")))
                ],
              ))
        ])));
  }

  Widget _buildBodyBuilderIos(BuildContext ctx, BoxConstraints cons) {
    double length = cons.maxWidth * 0.75;
    GMap gmap = GMap(length: length);
    return Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        padding: const EdgeInsets.only(top: 15),
        child: Center(
            child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: Container(width: length, height: length, child: gmap)),
          Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text('Confirm that the GPS is correct',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none)),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CupertinoButton(
                          onPressed: () async => await gmap.getCurrentLocation(),
                          color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text("Record")))
                ],
              ))
        ])));
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
        child: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilderIos)));
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
