import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_time_app/utils/widgets.dart';

class DefaultAppTab extends StatefulWidget {
  static const title = 'AppTab';
  static const androidIcon = Icon(Icons.android);
  static const iosIcon = Icon(CupertinoIcons.tag);

  const DefaultAppTab({Key key, this.androidDrawer}) : super(key: key);

  final Widget androidDrawer;

  @override
  _DefaultAppTabState createState() => _DefaultAppTabState();
}

class _DefaultAppTabState extends State<DefaultAppTab> {
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

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            'Hellow flutter',
            style: Theme.of(context).textTheme.display1,
          )),
        ],
      ),
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
        body: this._buildBody(context));
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
      child: _buildBody(context),
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
