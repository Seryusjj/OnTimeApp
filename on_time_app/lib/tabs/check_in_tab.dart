
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


  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons){
    double length = cons.maxWidth * 0.75;
    return Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
            child: Column(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(360.0),
                  child: Container(width: length, height: length, child: Map()))
            ])));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CheckInTab.title),
      ),
        body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder))
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder))
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}