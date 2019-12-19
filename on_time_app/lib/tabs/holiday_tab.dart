import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:on_time_app/tabs/settings_tab.dart';
import 'package:on_time_app/utils/widgets.dart';

class HolidayTab extends StatefulWidget {
  static const title = 'Holiday';
  static const androidIcon = Icon(Icons.local_hotel);
  static const iosIcon = Icon(Icons.local_hotel);

  @override
  State<StatefulWidget> createState() => _HolidayTabState();
}

class _HolidayTabState extends State<HolidayTab> {
  DateTime _currentDate;
  int _currentYear;
  DateTime _start;
  DateTime _end;
  DateTime _today;

  _HolidayTabState() {
    _currentDate = DateTime.now();
    _today = DateTime(_currentDate.year, _currentDate.month, _currentDate.day, _currentDate.hour, _currentDate.minute);
    _currentYear = _currentDate.year;
  }

  @override
  void initState() {
    super.initState();
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
    if (_start != null && _end != null) {
      int endComp = day.compareTo(_end);
      int startComp = day.compareTo(_start);
      bool validEnd = endComp == 0 || endComp < 0;
      bool validStart = startComp == 0 || startComp > 0;
      if (validEnd && validStart) {
        return Center(
            child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(Icons.hotel, color: Colors.black54),
            Text(day.day.toString())
          ],
        ));
      }
    }
    return null;
  }

  void _updateBeginAndEnd(DateTime date) {
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
              minSelectedDate: DateTime(_currentYear - 3),
              maxSelectedDate: DateTime(_currentYear + 3),
              weekendTextStyle: TextStyle(
                color: Colors.red.shade900,
              ),
              selectedDayButtonColor: Colors.blue,
              thisMonthDayBorderColor: Colors.blue.shade800)),
      _getButton()
    ]);
  }

  Widget _getButton() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            splashColor: Colors.blueAccent.shade700,
            onPressed: () => {},
            child: Text("Leave Request"));
      case TargetPlatform.iOS:
        return CupertinoButton(
            onPressed: () => {},
            color: Colors.blueAccent,
            child: Text("Leave Request"));
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
