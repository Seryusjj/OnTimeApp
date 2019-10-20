import 'package:flutter/material.dart';
import 'package:on_time_app/home/home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'On Time-app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeWidget(),
    );
  }
}
