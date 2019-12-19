import 'package:shared_preferences/shared_preferences.dart';

class Config {

  static bool useWifi;

  static initAll() async {
    useWifi = await useWifiLoader();
  }

  static Future<bool> useWifiLoader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var useWifi = await prefs.getBool('useWifi');
    if (useWifi == null) {
      await prefs.setBool('useWifi', false);
      useWifi = false;
    }
    return useWifi;
  }

  static Future<bool> updateUseWifi(bool newVal) async {
    useWifi = newVal;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('useWifi', newVal);
    return newVal;
  }
}
