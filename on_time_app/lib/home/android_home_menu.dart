import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_time_app/tabs/default_app_tab.dart';

@protected
class AndroidHomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultAppTab(
        androidDrawer: SizedBox(
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
                    leading: DefaultAppTab.androidIcon,
                    title: Text(DefaultAppTab.title),
                    onTap: () {
                      /*Navigator.pop(context);
                  Navigator.push<void>(
                      context, MaterialPageRoute(builder: (context) => NewsTab()));*/
                    },
                  ),
                  ListTile(
                    leading: DefaultAppTab.androidIcon,
                    title: Text(DefaultAppTab.title),
                    onTap: () {
                      /*Navigator.pop(context);
                  Navigator.push<void>(context,
                      MaterialPageRoute(builder: (context) => ProfileTab()));*/
                    },
                  ),
                  // Long drawer contents are often segmented.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),
                  ListTile(
                    leading: DefaultAppTab.androidIcon,
                    title: Text(DefaultAppTab.title),
                    onTap: () {
                      /*Navigator.pop(context);
                  Navigator.push<void>(context,
                      MaterialPageRoute(builder: (context) => SettingsTab()));*/
                    },
                  ),
                ],
              ),
            )));
  }
}
