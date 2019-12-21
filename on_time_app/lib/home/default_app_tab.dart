import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:on_time_app/data/data_repository.dart';
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

  List<CheckInResponse> _currentCheckIns;
  String userMail;
  int _currentYear;

  int _pendingApprovalCount;

  _DefaultAppTabState(this.userMail) {
    _currentCheckIns = new List<CheckInResponse>();
    _currentYear = _currentDate.year;
    _pendingApprovalCount = 0;
  }

  set _currentDate(DateTime _currentDate) {
    DataRepository.selectedDate = _currentDate;
  }

  get _currentDate {
    return DataRepository.selectedDate;
  }

  @override
  void dispose() {
    _currentCheckIns = [];
    DataRepository.currentCheckIns.removeListener(_listenCurrentCheckIns);
    DataRepository.pendingApprovals.removeListener(_listenPendingApprovals);
    super.dispose();
  }

  void _listenCurrentCheckIns() {
    this.setState(
        () => _currentCheckIns = DataRepository.currentCheckIns.value);
  }

  void _listenPendingApprovals() {
    this.setState(() => {
          _pendingApprovalCount = DataRepository.pendingApprovals.value.length
        });
  }

  @override
  void initState() {
    super.initState();
    // subscribe
    DataRepository.currentCheckIns.addListener(_listenCurrentCheckIns);
    DataRepository.pendingApprovals.addListener(_listenPendingApprovals);

    // trigger update
    _updateCheckIns(_currentDate);
    _updatePendingApproval(userMail);
  }

  Future<void> _updateCheckIns(DateTime time) async {
    return DataRepository.updateCheckInInfo(context, time, userMail);
  }

  Future<void> _updatePendingApproval(String email) async {
    return DataRepository.updatePendingApprovals(context, userMail);

  }

  Widget _getCard(CheckInResponse response) {
    var format = [dd, '/', mm, '/', yyyy, ' - ', HH, ':', nn, ':', ss];
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
          onTap: null,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.grey,
                  child: response.location
                      ? Icon(Icons.location_on)
                      : Icon(Icons.wifi),
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatDate(response.utcDateTime.toLocal(), format),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(response.info)
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
                  _updateCheckIns(date)
                      .then((v) => this.setState(() => {_currentDate = date}));
                },
                weekFormat: true,
                headerMargin: const EdgeInsets.symmetric(vertical: 5),
                minSelectedDate: DateTime(DataRepository.fromYear),
                maxSelectedDate: DateTime(DataRepository.toYear),
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RequestsPage(userMail)));
  }

  void _navigateLogout(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LogInPage()));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DefaultAppTab.title),
          actions: [
            _mailIconAndroid(),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _navigateLogout(context),
            )
          ],
        ),
        drawer: widget.androidDrawer,
        body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)));
  }

  Widget _mailIconIos() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Icon(Icons.mail),
        Padding(
            child: Text(
                _pendingApprovalCount > 0
                    ? _pendingApprovalCount.toString()
                    : '',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
            padding: EdgeInsets.fromLTRB(12, 8, 0, 0)),
      ],
    );
  }

  Widget _mailIconAndroid() {
    return Container(
      height: 24, //icon default size
      decoration: new BoxDecoration(color: Colors.transparent),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.mail),
              onPressed: () => _navigateMail(context),
            ),
            Padding(
                child: Text(
                    _pendingApprovalCount > 0
                        ? _pendingApprovalCount.toString()
                        : '',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                padding: EdgeInsets.fromLTRB(12, 12, 0, 0)),
          ],
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)),
        navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => LogInPage()),
                    (f) => false);
              },
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: _mailIconIos(),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(
                    title: RequestsPage.title,
                    fullscreenDialog: true,
                    builder: (context) => RequestsPage(userMail),
                  ),
                );
              },
            )));
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
