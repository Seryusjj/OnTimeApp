import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_time_app/home/default_app_tab.dart';
import 'package:on_time_app/tabs/check_in_tab.dart';
import 'package:on_time_app/tabs/check_in_wifi_tab.dart';
import 'package:on_time_app/tabs/holiday_tab.dart';
import 'package:on_time_app/tabs/settings_tab.dart';
import 'package:on_time_app/utils/config.dart';

@protected
class AndroidHomeMenu extends StatelessWidget {
  final String userMail;

  AndroidHomeMenu(this.userMail);

  Widget _androidDrawer(BuildContext context, GlobalKey mainKey) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.blue.shade800,
                    size: 80,
                  ),
                ),
              ),
              ListTile(
                leading: DefaultAppTab.androidIcon,
                title: Text(DefaultAppTab.title),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: CheckInWifiTab.androidIcon,
                title: Text(CheckInWifiTab.title),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => Config.useWifi ? CheckInWifiTab(userMail) : CheckInTab(userMail)));
                },
              ),
              ListTile(
                leading: HolidayTab.androidIcon,
                title: Text(HolidayTab.title),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push<void>(context,
                      MaterialPageRoute(builder: (context) => HolidayTab()));
                },
              ),
              // Long drawer contents are often segmented.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              ListTile(
                leading: SettingsTab.androidIcon,
                title: Text(SettingsTab.title),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push<void>(context,
                      MaterialPageRoute(builder: (context) => SettingsTab()));
                },
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey();
    return DefaultAppTab(
      userMail,
      androidDrawer: _androidDrawer(context, _key),
      key: _key,
    );
  }
}
