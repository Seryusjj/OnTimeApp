import 'package:flutter/cupertino.dart';
import 'package:on_time_app/home/default_app_tab.dart';
import 'package:on_time_app/tabs/check_in_tab.dart';
import 'package:on_time_app/tabs/check_in_wifi_tab.dart';
import 'package:on_time_app/tabs/holiday_tab.dart';
import 'package:on_time_app/utils/config.dart';

@protected
class IosHomeMenu extends StatelessWidget {

  final String userMail;

  IosHomeMenu(this.userMail);

  Widget _buildCheckIn(BuildContext context) {
    return Config.useWifi ? CheckInWifiTab(userMail) : CheckInTab(userMail);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              title: Text(DefaultAppTab.title), icon: DefaultAppTab.iosIcon),
          BottomNavigationBarItem(
              title: Text(CheckInTab.title), icon: CheckInTab.iosIcon),
          BottomNavigationBarItem(
              title: Text(HolidayTab.title), icon: HolidayTab.iosIcon),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: DefaultAppTab.title,
              builder: (context) => DefaultAppTab(userMail),
            );
          case 1:

            return CupertinoTabView(
              defaultTitle: CheckInTab.title,
              builder: _buildCheckIn,
            );
          case 2:
            return CupertinoTabView(
              defaultTitle: HolidayTab.title,
              builder: (context) => HolidayTab(),
            );
          default:
            assert(false, DefaultAppTab.title);
            return null;
        }
      },
    );
  }
}
