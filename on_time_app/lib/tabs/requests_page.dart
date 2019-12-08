import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_time_app/utils/widgets.dart';

class RequestsPage extends StatefulWidget {
  static String title = "Requests";

  @override
  State<StatefulWidget> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    return Container(
        child: ListView.builder(
          itemBuilder: _listBuilder,
        ),
        decoration: BoxDecoration(color: Colors.lightBlue));
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= 3) return null;

    return SafeArea(
        top: false,
        bottom: false,
        child: Card(
          elevation: 1.5,
          margin: EdgeInsets.fromLTRB(6, 12, 6, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.check),
                    )),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.cancel),
                    )),
                Padding(padding: EdgeInsets.only(left: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Holiday req. from: user',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        'Leaving from x to y',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(RequestsPage.title),
        ),
        body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder)));
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: Scaffold(
            body: SafeArea(child: LayoutBuilder(builder: _buildBodyBuilder))));
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
