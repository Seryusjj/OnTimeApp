import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_time_app/data/data_repository.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

class RequestsPage extends StatefulWidget {
  static String title = "Requests";

  final String userEmail;

  RequestsPage(this.userEmail);

  @override
  State<StatefulWidget> createState() => _RequestsPageState(userEmail);
}

class _RequestsPageState extends State<RequestsPage> {
  final String userEmail;
  List<HolidayRequestResponse> _pendingApprovals;
  HolidaysApi _holidaysApi;

  _RequestsPageState(this.userEmail) {
    this._pendingApprovals = DataRepository.pendingApprovals.value;
    _holidaysApi = new HolidaysApi();
  }

  @override
  void dispose() {
    DataRepository.pendingApprovals.removeListener(_listenPendingApprovals);
    super.dispose();
  }

  _listenPendingApprovals() {
    setState(() {
      this._pendingApprovals = DataRepository.pendingApprovals.value;
    });
  }

  @override
  initState() {
    super.initState();
    DataRepository.pendingApprovals.addListener(_listenPendingApprovals);
  }

  Widget _buildBodyBuilder(BuildContext ctx, BoxConstraints cons) {
    return Container(
        child: ListView.builder(
          itemBuilder: _listBuilder,
        ),
        decoration: BoxDecoration(color: Colors.lightBlue));
  }

  _approve(HolidayRequestResponse req) async {
    Map<String, dynamic> json = Map();
    json['requestId'] = req.id;
    var send = HolidayApproveRequest.fromJson(json);
    var response = await _holidaysApi.apiV1HolidaysApprovePost(body: send);
    if (response.success) {
      await DataRepository.updatePendingApprovals(context, userEmail);
      await DataRepository.updateUserRequests(context, userEmail);
      DialogManager.showInfo(context, "Succesfully approved");
    } else {
      DialogManager.showErrors(context, response.errors);
    }
  }

  _cancel(HolidayRequestResponse req) async {
    Map<String, dynamic> json = Map();
    json['requestId'] = req.id;
    var send = HolidayDeleteRequest.fromJson(json);
    var response = await _holidaysApi.apiV1HolidaysDeletePost(body: send);
    if (response.success) {
      await DataRepository.updatePendingApprovals(context, userEmail);
      await DataRepository.updateUserRequests(context, userEmail);
      DialogManager.showInfo(context, "Succesfully cancelled");
    } else {
      DialogManager.showErrors(context, response.errors);
    }
  }

  Widget _getCard(HolidayRequestResponse req) {
    var format = [dd, '/', mm, '/', yyyy];
    var from = formatDate(req.dateFrom.toLocal(), format);
    var to = formatDate(req.dateTo.toLocal(), format);
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
                Container(
                    height: 65,
                    color: Colors.green.withAlpha(200),
                    child: IconButton(
                        splashColor: Colors.green.shade800,
                        color: Colors.white,
                        icon: Icon(Icons.check),
                        onPressed: () => _approve(req))),
                Container(
                    height: 65,
                    color: Colors.red.withAlpha(200),
                    child: IconButton(
                        splashColor: Colors.red.shade800,
                        color: Colors.white,
                        icon: Icon(Icons.cancel),
                        onPressed: () => _cancel(req))),
                Padding(padding: EdgeInsets.only(left: 5)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Holiday req. from: ${req.userEmail}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        'From: $from To: $to',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _pendingApprovals.length) return null;

    return _getCard(_pendingApprovals[index]);
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
