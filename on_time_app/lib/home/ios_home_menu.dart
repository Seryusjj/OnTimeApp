import 'package:flutter/cupertino.dart';
import 'package:on_time_app/tabs/default_app_tab.dart';

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
              title: Text(DefaultAppTab.title), icon: DefaultAppTab.iosIcon),
          BottomNavigationBarItem(
              title: Text(DefaultAppTab.title), icon: DefaultAppTab.iosIcon),
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
              defaultTitle: DefaultAppTab.title,
              builder: (context) => DefaultAppTab(),
            );
          case 2:
            return CupertinoTabView(
              defaultTitle: DefaultAppTab.title,
              builder: (context) => DefaultAppTab(),
            );
          default:
            assert(false, DefaultAppTab.title);
            return null;
        }
      },
    );
  }
}
