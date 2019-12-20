import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:on_time_app/tabs/settings_tab.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

class HolidayTab extends StatefulWidget {
  static const title = 'Holiday';
  static const androidIcon = Icon(Icons.local_hotel);
  static const iosIcon = Icon(Icons.local_hotel);

  final String userEmail;

  HolidayTab(this.userEmail);

  @override
  State<StatefulWidget> createState() => _HolidayTabState(userEmail);
}

class _HolidayTabState extends State<HolidayTab> {
  List<HolidayRequestResponse> _userRequests;

  DateTime _currentDate;
  int _currentYear;
  int _plus_years;
  DateTime _start;
  DateTime _end;
  DateTime _today;
  HolidaysApi _holidaysApi;

  final String userEmail;

  _HolidayTabState(this.userEmail) {
    _currentDate = DateTime.now();
    _today = DateTime(_currentDate.year, _currentDate.month, _currentDate.day,
        _currentDate.hour, _currentDate.minute);
    _currentYear = _currentDate.year;
    _plus_years = 3;
    _holidaysApi = new HolidaysApi();
    _userRequests = [];
  }

  @override
  void initState() {
    super.initState();
    _holidaysApi
        .apiV1HolidaysEmailFromToGet(this.userEmail, _currentYear - _plus_years,
            _currentYear + _plus_years)
        .then((r) => {this.setState(() => _userRequests = r.response)});
  }

  Widget _dayBuilder(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime day,
  ) {
    if (_shouldPaintIcon(day, _start, _end)) {
      return Center(
          child: Column(
        // Replace with a Row for horizontal icon + text
        children: <Widget>[
          Icon(Icons.hotel, color: Colors.black54),
          Text(
            day.day.toString(),
            style: TextStyle(color: Colors.amber.shade800),
          )
        ],
      ));
    }

    for (final i in _userRequests) {
      // maybe use the delete info to show something to user ...
      if (!i.deleted && _shouldPaintIcon(day, i.dateFrom.toLocal(), i.dateTo.toLocal())) {
        return Center(
            child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(Icons.hotel, color: Colors.black54),
            Text(
              day.day.toString(),
              style: TextStyle(
                  color: i.approved
                      ? Colors.green.shade800
                      : Colors.amber.shade800),
            )
          ],
        ));
      }
    }
    return null;
  }

  bool _shouldPaintIcon(DateTime day, DateTime start, DateTime end) {
    if (start != null && end != null) {
      int endComp = day.compareTo(end);
      int startComp = day.compareTo(start);
      bool validEnd = endComp == 0 || endComp < 0;
      bool validStart = startComp == 0 || startComp > 0;
      return validEnd && validStart;
    }
    return false;
  }

  bool isUnusedDate(DateTime date) {
    bool unusedDay = true;
    for (final i in _userRequests) {
      if (!i.deleted && _shouldPaintIcon(date, i.dateFrom.toLocal(), i.dateTo.toLocal())) {
        return false;
      }
    }
    return unusedDay;
  }

  void _updateBeginAndEnd(DateTime date) {
    if (!isUnusedDate(date)) return;

    if (_start == null) {
      int comp = date.compareTo(_today);
      bool valid = comp == 0 || comp > 0;
      _start = valid ? date : null;
    } else if (_end == null) {
      int endComp = _start.compareTo(date);
      bool validEnd = endComp == 0 || endComp < 0;
      _end = validEnd ? date : null;
      _start = validEnd ? _start : null;
      if (_end == null && _start == null) {
        _updateBeginAndEnd(date);
      }
    } else if (_end != null && _start != null) {
      _start = null;
      _end = null;
      _updateBeginAndEnd(date);
    }
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    return Column(children: [
      Center(
          child: CalendarCarousel(
              onDayPressed: (DateTime date, List<Event> events) {
                this._updateBeginAndEnd(date);
                this.setState(() => _currentDate = date);
              },
              headerMargin: const EdgeInsets.symmetric(vertical: 5),
              customDayBuilder: _dayBuilder,
              width: cons.maxWidth,
              height: cons.maxHeight * 0.80,
              daysHaveCircularBorder: true,
              selectedDateTime: _currentDate,
              minSelectedDate: DateTime(_currentYear - _plus_years),
              maxSelectedDate: DateTime(_currentYear + _plus_years),
              weekendTextStyle: TextStyle(
                color: Colors.red.shade900,
              ),
              selectedDayButtonColor: Colors.blue,
              thisMonthDayBorderColor: Colors.blue.shade800)),
      _getButton()
    ]);
  }

  Future<void> leaveRequest() async {
    if (_start == null || _end == null) {
      DialogManager.showError(context, "Please first, select the leaving days");
      return;
    }
    Map<String, dynamic> json = Map();
    json['from'] = _start.toUtc().toIso8601String();
    json['to'] = _end.toUtc().toIso8601String();
    json['userEmail'] = userEmail;
    var req = HolidayRequestRegistration.fromJson(json);
    var register = await _holidaysApi.apiV1HolidaysRegisterPost(body: req);
    if (register.success) {
      setState(() {
        _userRequests.add(register);
      });
      DialogManager.showInfo(context, "Request submitted");
    } else {
      DialogManager.showErrors(context, register.errors);
    }
  }

  Widget _getButton() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            splashColor: Colors.blueAccent.shade700,
            onPressed: () => {leaveRequest()},
            child: Text("Leave Request"));
      case TargetPlatform.iOS:
        return CupertinoButton(
            onPressed: () => {leaveRequest()},
            color: Colors.blueAccent,
            child: Text("Request"));
      default:
        return null;
    }
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(HolidayTab.title),
        ),
        body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)));
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: SettingsTab.iosIcon,
          onPressed: () {
            // This pushes the settings page as a full page modal dialog on top
            // of the tab bar and everything.
            Navigator.of(context, rootNavigator: true).push<void>(
              CupertinoPageRoute(
                title: SettingsTab.title,
                fullscreenDialog: true,
                builder: (context) => SettingsTab(),
              ),
            );
          },
        )),
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
