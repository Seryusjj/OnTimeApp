import 'package:flutter/cupertino.dart';
import 'package:on_time_app/home/default_app_tab.dart';
import 'package:on_time_app/tabs/check_in_tab.dart';
import 'package:on_time_app/tabs/check_in_wifi_tab.dart';
import 'package:on_time_app/tabs/holiday_tab.dart';

@protected
class IosHomeMenu extends StatelessWidget {
  IosHomeMenu();

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
              builder: (context) => DefaultAppTab(),
            );
          case 1:
            return CupertinoTabView(
              defaultTitle: CheckInTab.title,
              builder: (context) => CheckInWifiTab(),
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
