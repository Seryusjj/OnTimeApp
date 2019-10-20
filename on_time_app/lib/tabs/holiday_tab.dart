import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_time_app/utils/widgets.dart';

class HolidayTab extends StatefulWidget {
  static const title = 'Holiday';
  static const androidIcon = Icon(Icons.local_hotel);
  static const iosIcon = Icon(Icons.local_hotel);

  @override
  State<StatefulWidget> createState() => _HolidayTabState();
}

class _HolidayTabState extends State<HolidayTab> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    return Container(decoration: BoxDecoration(color: Colors.blue));
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
        navigationBar: CupertinoNavigationBar(),
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
