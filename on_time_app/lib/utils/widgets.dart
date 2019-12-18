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

  static _singleAcceptButtonMessage(
      BuildContext context, String message, String title, VoidCallback callback) {
    _showDialog(context, (BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              Center(
                  child: CupertinoButton(
                      child: Text('Accept'),
                      onPressed: () {
                        if(callback!=null)
                          callback();
                        Navigator.pop(context);
                      }))
            ],
          );
        case TargetPlatform.android:
          return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                Center(
                    child: FlatButton(
                        child: Text('Accept'),
                        onPressed: () {
                          if(callback!=null)
                            callback();
                          Navigator.pop(context);
                        })),
              ]);

        default:
          return null;
      }
    });
  }

  static showError(BuildContext context, String message, {VoidCallback callback}) {
    _singleAcceptButtonMessage(context, message, 'Error', callback);
  }

  static showException(BuildContext context, String message, {VoidCallback callback}) {
    _singleAcceptButtonMessage(context, message, 'Exception', callback);
  }

  static showInfo(BuildContext context, String message, {VoidCallback callback}) {
    _singleAcceptButtonMessage(context, message, 'Info', callback);
  }

  static showCheckInPause(BuildContext context, String message, {VoidCallback onPause, VoidCallback onOut, VoidCallback onCancel}) {
    _showDialog(context, (BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return CupertinoAlertDialog(
            title: Text('Confirm'),
            content: Text(message),
            actions: <Widget>[
              CupertinoButton(
                  child: Text('Pause'),
                  onPressed: () {
                    if (onPause != null)
                      onPause();
                    Navigator.pop(context);
                  }),
              CupertinoButton(
                  child: Text('Out'),
                  onPressed: () async {
                    if (onOut != null)
                      onOut();
                    Navigator.pop(context);
                  }),
              CupertinoButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    if(onCancel != null)
                      onCancel();
                    Navigator.pop(context);
                  }),
            ],
          );
        case TargetPlatform.android:
          return AlertDialog(
              title: Text('Confirm'),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                    child: Text('Pause'),
                    onPressed: () {
                      if (onPause != null)
                        onPause();
                      Navigator.pop(context);
                    }),
                FlatButton(
                    child: Text('Out'),
                    onPressed: () {
                      if (onOut != null)
                        onOut();
                      Navigator.pop(context);
                    }),
                FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      if(onCancel != null)
                        onCancel();
                      Navigator.pop(context);
                    }),
              ]);
        default:
          return null;
      }
    });
  }

  static showConfirmation(BuildContext context, String message, {VoidCallback onAccept, VoidCallback onCancel}) {
    _showDialog(context, (BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return CupertinoAlertDialog(
            title: Text('Confirm'),
            content: Text(message),
            actions: <Widget>[
              CupertinoButton(
                  child: Text('Accept'),
                  onPressed: () {
                    if (onAccept != null)
                      onAccept();
                    Navigator.pop(context);
                  }),
              CupertinoButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    if(onCancel != null)
                      onCancel();
                    Navigator.pop(context);
                  }),
            ],
          );
        case TargetPlatform.android:
          return AlertDialog(
              title: Text('Confirm'),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                    child: Text('Accept'),
                    onPressed: () {
                      if (onAccept != null)
                        onAccept();
                      Navigator.pop(context);
                    }),
                FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      if(onCancel != null)
                        onCancel();
                      Navigator.pop(context);
                    }),
              ]);
        default:
          return null;
      }
    });
  }


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
