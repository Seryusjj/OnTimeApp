import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_time_app/utils/config.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsTab extends StatefulWidget {
  static const title = 'Settings';
  static const androidIcon = Icon(Icons.settings);
  static const iosIcon = Icon(CupertinoIcons.gear);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var useWifiSwitch = false;

  @override
  initState() {
    super.initState();
    useWifiSwitch = Config.useWifi;
  }

  useWifi(bool value) async {
    var v = await Config.updateUseWifi(value);
    setState(() {
      useWifiSwitch = v;
    });
  }

  Widget _buildList() {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 24)),
        ListTile(
          title: Text('Use wifi instead of GPS'),
          // The Material switch has a platform adaptive constructor.
          trailing: Switch.adaptive(
            value: useWifiSwitch,
            onChanged: (value) => useWifi(value),
          ),
        )
      ],
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsTab.title),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Scaffold(body: _buildList()),
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
