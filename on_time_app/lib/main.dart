import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:on_time_app/home/home_widget.dart';
import 'package:on_time_app/log_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swagger/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    // conf http client from gen code ...
    defaultApiClient.basePath = 'https://10.0.2.2:5001';
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) =>
              true); // accept any certificate
    IOClient ioClient = new IOClient(httpClient);
    defaultApiClient.client = ioClient;

    // build app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'On Time-app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LogInPage()
    );
  }
}
