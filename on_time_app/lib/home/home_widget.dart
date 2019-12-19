import 'package:flutter/widgets.dart';
import 'package:on_time_app/utils/config.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'android_home_menu.dart';
import 'ios_home_menu.dart';

class HomeWidget extends StatefulWidget {


  final String userMail;

  const HomeWidget({this.userMail});

  @override
  _HomeWidgetState createState() => _HomeWidgetState(userMail);
}

class _HomeWidgetState extends State<HomeWidget> {

  final String userMail;

  @override
  initState() {
    super.initState();
  }

  _HomeWidgetState(this.userMail);

  Widget _buildAndroidHomePage(BuildContext context) {
    return AndroidHomeMenu(userMail);
  }

  Widget _buildIosHomePage(BuildContext context) {
    return IosHomeMenu(userMail);
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}
