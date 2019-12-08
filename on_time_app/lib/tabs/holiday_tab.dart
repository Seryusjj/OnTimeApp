import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    double wPad = cons.maxWidth * 0.15;
    return Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(children: <Widget>[
          CalendarCarousel<Event>(
              onDayPressed: (DateTime date, List <Event> events) {
                this.setState(() => _currentDate = date);
              },
              width: cons.maxWidth,
              height: cons.maxHeight *0.80,
              weekFormat: false,
              daysHaveCircularBorder: true,
              selectedDateTime: _currentDate,
              weekendTextStyle: TextStyle(
                color: Colors.red.shade900,
              ),
              selectedDayButtonColor: Colors.blue,
              thisMonthDayBorderColor: Colors.blue.shade800),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blueAccent,
              splashColor: Colors.blueAccent.shade700,
              onPressed: () => {},
              child: Text("Leave Request"))
        ]
        ));
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
