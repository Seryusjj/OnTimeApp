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

  CheckInTab({Key key, this.userMail}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckInTabState(userMail);
}

class _CheckInTabState extends State<CheckInTab> {
  String userMail;
  CheckInRecordsApi _recordsApi;
  bool _recordDisabled;
  final _key = GlobalKey<GMapState>();
  bool _endDay;
  int _hours;
  int _minutes;

  _CheckInTabState(this.userMail) {
    _recordsApi = new CheckInRecordsApi();
    _recordDisabled = false;
    _endDay = false;
  }

  @override
  void initState() {
    super.initState();
    _recordsApi
        .apiV1CheckInRecordsEmailDateGet(userMail, DateTime.now().toUtc())
        .then((l) => {
              _calculateWorkedTime(l),
            });
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
                      onPressed: () => _key.currentState.getCurrentLocation()),
                  Padding(
                      padding: EdgeInsets.only(top: columnH * 0.1),
                      child: checkInButton())
                ],
              ))
        ])));
  }

  _cancelAction() {
    setState(() => _recordDisabled = false);
  }

  _outAction(Map json) async {
    json['endDay'] = true;
    await _recordsApi.apiV1CheckInRecordsRegisterPost(
        body: CheckInResgistrationRequest.fromJson(json));
    _recordDisabled = false;
    var checkIns = await _recordsApi.apiV1CheckInRecordsEmailDateGet(
        userMail, DateTime.now().toUtc());
    await _calculateWorkedTime(checkIns);
  }

  _acceptAction(Map json) {
    _recordsApi
        .apiV1CheckInRecordsRegisterPost(
            body: CheckInResgistrationRequest.fromJson(json))
        .then((r) => {
              setState(() => _recordDisabled = false),
            });
  }

  _recordLocation() async {
    if (!_recordDisabled) {
      setState(() {
        _recordDisabled = true;
      });

      var checkIns = await _recordsApi.apiV1CheckInRecordsEmailDateGet(
          userMail, DateTime.now().toUtc());

      await _calculateWorkedTime(checkIns);

      var l = await _key.currentState.getCurrentLocation();

      Map json = Map<String, dynamic>();
      json['userEmail'] = userMail;
      json['info'] = 'lat: ${l.latitude}, long: ${l.longitude}';
      json['location'] = true;
      json['utcDateTime'] = null;
      json['endDay'] = false;

      String message = '';
      if (checkIns.response.length == 0) {
        message = 'Perform first check in of the day?';
        DialogManager.showConfirmation(context, message,
            onAccept: () => _acceptAction(json), onCancel: _cancelAction);
      } else if (checkIns.response.length % 2 == 0) {
        message = 'Are you back from your pause ?';
        DialogManager.showConfirmation(context, message,
            onAccept: () => _acceptAction(json), onCancel: _cancelAction);
      } else {
        message = 'Are you going out for a pause or you are done for today?';
        DialogManager.showCheckInPause(context, message,
            onPause: () => _acceptAction(json),
            onOut: () => _outAction(json),
            onCancel: _cancelAction);
      }
    }
  }

  Future _calculateWorkedTime(CheckInResponseResponseSet checkIns) async {
    var count = 0;
    var endDay = checkIns.response.any((x) =>
      x.endDay == true


    );
    if (endDay) {
      var calculated =
          await _recordsApi.apiV1CheckInRecordsWorkedTimeEmailDateGet(
              userMail, DateTime.now().toUtc());
      if (calculated.success) {
        setState(() {
          _endDay = endDay;
          _hours = calculated.hours;
          _minutes = calculated.minutes;
        });
      }
    }
  }

  Widget checkInButton() {
    if (_endDay) {
      return Container(
          child: Text('Worked time : ' +
              _hours.toString() +
              ':' +
              _minutes.toString()));
    }
    if (_recordDisabled) {
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
