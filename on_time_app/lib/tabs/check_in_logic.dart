import 'package:flutter/cupertino.dart';
import 'package:on_time_app/data/data_repository.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

class CheckInLogic<T extends StatefulWidget> extends State<T> {
  CheckInRecordsApi recordsApi;
  bool endDay;
  bool recordDisabled;
  String userMail;
  int workedHours;
  int workedMinutes;

  var _timeout = Duration(seconds: 10);

  CheckInLogic(this.userMail) {
    recordsApi = new CheckInRecordsApi();
    recordDisabled = false;
    endDay = false;
  }

  Future calculateWorkedTime(CheckInResponseResponseSet checkIns) async {
    var endDay = checkIns.response.any((x) => x.endDay);
    if (endDay) {
      var calculated =
          await recordsApi.apiV1CheckInRecordsWorkedTimeEmailDateGet(
              userMail, DataRepository.today);
      if (calculated.success) {
        setState(() {
          this.endDay = endDay;
          this.workedHours = calculated.hours;
          this.workedMinutes = calculated.minutes;
        });
      }
    }
  }

  cancelAction() {
    setState(() => recordDisabled = false);
  }

  outAction(Map json) async {
    json['endDay'] = true;
    await recordsApi.apiV1CheckInRecordsRegisterPost(
        body: CheckInResgistrationRequest.fromJson(json));
    recordDisabled = false;
    var checkIns = await recordsApi.apiV1CheckInRecordsEmailDateGet(
        userMail, DataRepository.today);
    await refreshDataRepoCheckIns();
    await calculateWorkedTime(checkIns);
  }

  acceptAction(Map json) async {
    var res = await recordsApi
        .apiV1CheckInRecordsRegisterPost(
            body: CheckInResgistrationRequest.fromJson(json))
        .timeout(_timeout,
            onTimeout: () =>
                DialogManager.showException(context, "Connection timeout"));
    if (res.success) {
      await refreshDataRepoCheckIns();

      setState(() => recordDisabled = false);
    } else {
      DialogManager.showErrors(context, res.errors);
    }
  }

  Future refreshDataRepoCheckIns() async {
      await DataRepository.updateCheckInInfo(
          context, DataRepository.selectedDate, userMail);
  }

  recordLocation() async {
    if (!recordDisabled) {
      setState(() {
        recordDisabled = true;
      });

      var checkIns = await recordsApi.apiV1CheckInRecordsEmailDateGet(
          userMail, DataRepository.today);

      await calculateWorkedTime(checkIns);

      var json = await getInfo();
      if (json == null) return;

      String message = '';
      if (checkIns.response.length == 0) {
        message = 'Perform first check in of the day ?';
        DialogManager.showConfirmation(context, message,
            onAccept: () => acceptAction(json), onCancel: cancelAction);
      } else if (checkIns.response.length % 2 == 0) {
        message = 'Are you back from your pause ?';
        DialogManager.showConfirmation(context, message,
            onAccept: () => acceptAction(json), onCancel: cancelAction);
      } else {
        message = 'Are you going out for a pause or you are done for today ?';
        DialogManager.showCheckInPause(context, message,
            onPause: () => acceptAction(json),
            onOut: () => outAction(json),
            onCancel: cancelAction);
      }
    }
  }

  @protected
  Future<Map<String, dynamic>> getInfo() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  @override
  void initState() {
    super.initState();
    recordsApi
        .apiV1CheckInRecordsEmailDateGet(userMail, DataRepository.today)
        .then((l) => {
              calculateWorkedTime(l),
            });
  }
}
