import 'dart:math';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:on_time_app/log_in_page.dart';
import 'package:on_time_app/tabs/requests_page.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

class DefaultAppTab extends StatefulWidget {
  static const title = 'My Week';
  static const androidIcon = Icon(Icons.calendar_today);
  static const iosIcon = Icon(Icons.calendar_today);
  final String userMail;

  const DefaultAppTab(this.userMail, {Key key, this.androidDrawer})
      : super(key: key);

  final Widget androidDrawer;

  @override
  _DefaultAppTabState createState() => _DefaultAppTabState(userMail);
}

class _DefaultAppTabState extends State<DefaultAppTab> {
  DateTime _currentDate;
  List<CheckInResponse> _currentCheckIns;
  CheckInRecordsApi _recordsApi;
  String userMail;

  _DefaultAppTabState(this.userMail) {
    _recordsApi = new CheckInRecordsApi();
    _currentCheckIns = new List<CheckInResponse>();

    _getCheckIns(DateTime.now()).then((v) => this.setState(
            () => { _currentCheckIns = v}));
  }

  @override
  void initState() {
    super.initState();
  }

  Future<List<CheckInResponse>> _getCheckIns(DateTime time) async {
    var res = await _recordsApi.apiV1CheckInRecordsEmailDateGet(userMail, time.toUtc());
    if (res.success) {
      return res.response;
    }
    return new List<CheckInResponse>();
  }

  Widget _getCard(CheckInResponse response) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Card(
        elevation: 1.5,
        margin: EdgeInsets.fromLTRB(6, 12, 6, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          // Make it splash on Android. It would happen automatically if this
          // was a real card but this is just a demo. Skip the splash on iOS.
          onTap: defaultTargetPlatform == TargetPlatform.iOS ? null : () {},
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.edit),
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatDate(response.utcDateTime.toLocal(), [dd, '/', mm, '/', yyyy, ' - ', HH, ':', nn, ':', ss]),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        response.info,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _currentCheckIns.length) return null;
    return _getCard(_currentCheckIns[index]);
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
            alignment: Alignment.topCenter,
            child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  _currentCheckIns.clear();
                  _getCheckIns(date).then((v) => this.setState(
                      () => {_currentDate = date, _currentCheckIns = v}));
                },
                weekFormat: true,
                width: cons.maxWidth,
                height: cons.maxHeight * 0.40,
                daysHaveCircularBorder: true,
                selectedDateTime: _currentDate,
                weekendTextStyle: TextStyle(
                  color: Colors.red.shade900,
                ),
                selectedDayButtonColor: Colors.blue,
                thisMonthDayBorderColor: Colors.blue.shade800),
            decoration: BoxDecoration(color: Colors.white)),
        Container(
            width: cons.maxWidth,
            height: cons.maxHeight * 0.60,
            child: ListView.builder(
              itemBuilder: _listBuilder,
            ),
            decoration: BoxDecoration(color: Colors.lightBlue)),
      ]),
    );
  }

  void _navigateMail(BuildContext context) {
    //Navigator.pop(context);
    Navigator.push<void>(
        context, MaterialPageRoute(builder: (context) => RequestsPage()));
  }

  void _navigateLogout(BuildContext context) {
    Navigator.popUntil(context, (route) => false);
    Navigator.push<void>(
        context, MaterialPageRoute(builder: (context) => LogInPage()));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DefaultAppTab.title),
          actions: [
            IconButton(
              icon: Icon(Icons.mail),
              onPressed: () => _navigateMail(context),
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _navigateLogout(context),
            )
          ],
        ),
        drawer: widget.androidDrawer,
        body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)));
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(Icons.mail),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push<void>(
                  CupertinoPageRoute(
                    title: RequestsPage.title,
                    fullscreenDialog: true,
                    builder: (context) => RequestsPage(),
                  ),
                );
              },
            ),
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.popUntil(context, (route) => false);
                Navigator.of(context, rootNavigator: true).push<void>(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => LogInPage(),
                  ),
                );
              },
            )),
        child: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)));
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
