import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:on_time_app/utils/widgets.dart';

class DefaultAppTab extends StatefulWidget {
  static const title = 'My Week';
  static const androidIcon = Icon(Icons.calendar_today);
  static const iosIcon = Icon(Icons.calendar_today);

  const DefaultAppTab({Key key, this.androidDrawer}) : super(key: key);

  final Widget androidDrawer;

  @override
  _DefaultAppTabState createState() => _DefaultAppTabState();
}

class _DefaultAppTabState extends State<DefaultAppTab> {
  DateTime _currentDate;

  @override
  void initState() {
    super.initState();
  }

  void _togglePlatform() {
    TargetPlatform _getOppositePlatform() {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return TargetPlatform.android;
      } else {
        return TargetPlatform.iOS;
      }
    }

    debugDefaultTargetPlatformOverride = _getOppositePlatform();
    // This rebuilds the application. This should obviously never be
    // done in a real app but it's done here since this app
    // unrealistically toggles the current platform for demonstration
    // purposes.
    WidgetsBinding.instance.reassembleApplication();
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= 10) return null;

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
                  child: Text(
                    'Check in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check bla bla bla',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        'Check title',
                      ),
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

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
            alignment: Alignment.topCenter,
            child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  this.setState(() => _currentDate = date);
                },
                weekFormat: true,
                width: cons.maxWidth,
                height: cons.maxHeight * 0.45,
                daysHaveCircularBorder: true,
                selectedDateTime: _currentDate,
                weekendTextStyle: TextStyle(
                  color: Colors.red.shade900,
                ),
                selectedDayButtonColor: Colors.blue,
                thisMonthDayBorderColor: Colors.blue.shade800)),
        Container(
            width: cons.maxWidth,
            height: cons.maxHeight * 0.55,
            child: ListView.builder(
              itemBuilder: _listBuilder,
            ),
            decoration: BoxDecoration(color: Colors.blue)),
      ]),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DefaultAppTab.title),
          actions: [
            IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: _togglePlatform,
            ),
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
            child: Icon(CupertinoIcons.shuffle),
            onPressed: _togglePlatform,
          ),
        ),
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
