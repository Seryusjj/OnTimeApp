import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key key,
    @required this.androidBuilder,
    @required this.iosBuilder,
  })  : assert(androidBuilder != null),
        assert(iosBuilder != null),
        super(key: key);

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return null;
    }
  }
}

class CustomIconButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final VoidCallback onPressed;

  CustomIconButton({this.width, this.height, this.icon, this.onPressed});

  @override
  Widget build(context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                child: Icon(icon, color: Colors.black54),
                onPressed: onPressed,
                backgroundColor: Colors.white)));
  }
}

class DialogManager {
  static _showDialog(BuildContext context, WidgetBuilder builder) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        showCupertinoDialog(context: context, builder: builder);
        break;
      case TargetPlatform.android:
        showDialog(context: context, builder: builder);
        break;
      default:
        break;
    }
  }

  static showError(BuildContext context, String message) {
    _showDialog(context, (BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: <Widget>[
              Center(
                  child: CupertinoButton(
                      child: Text('Accept'),
                      onPressed: () {
                        Navigator.pop(context);
                      }))
            ],
          );
        case TargetPlatform.android:
          return AlertDialog(
              title: Text('Error'),
              content: Text(message),
              actions: <Widget>[
                Center(
                    child: RaisedButton(
                        child: Text('Accept'),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ]);

        default:
          return null;
      }
    });
  }

  static showException(BuildContext context, String message) {
    _showDialog(context, (BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return CupertinoAlertDialog(
            title: Text('Exception'),
            content: Text(message),
            actions: <Widget>[
              Center(
                  child: CupertinoButton(
                      child: Text('Accept'),
                      onPressed: () {
                        Navigator.pop(context);
                      }))
            ],
          );
        case TargetPlatform.android:
          return AlertDialog(
              title: Text('Exception'),
              content: Text(message),
              actions: <Widget>[
                Center(
                    child: RaisedButton(
                        child: Text('Accept'),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ]);

        default:
          return null;
      }
    });
  }

  static showConfirmation(String message) {}

  static showErrors(BuildContext context, List<String> message) {
    String error = '';
    message.forEach((e) => error += e + '\n');
    showError(context, error);
  }

  static showExceptions(BuildContext context, List<String> message) {
    String error = '';
    message.forEach((e) => error += e + '\n');
    showException(context, error);
  }

  static showConfirmations(List<String> message) {}
}
