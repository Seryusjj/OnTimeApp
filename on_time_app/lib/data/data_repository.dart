import 'package:flutter/cupertino.dart';
import 'package:on_time_app/utils/widgets.dart';
import 'package:swagger/api.dart';

class DataRepository {
  static ValueNotifier<List<CheckInResponse>> currentCheckIns =
      ValueNotifier([]);
  static ValueNotifier<List<HolidayRequestResponse>> pendingApprovals =
      ValueNotifier([]);
  static ValueNotifier<List<HolidayRequestResponse>> userRequests =
      ValueNotifier([]);


  static DateTime today = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0);
  static DateTime selectedDate = today;
  static int plusYears = 3;
  static int fromYear = today.year - plusYears;
  static int toYear = today.year + plusYears;

  static Duration _timeout = Duration(seconds: 10);
  static CheckInRecordsApi _recordsApi = new CheckInRecordsApi();
  static HolidaysApi _holidaysApi = new HolidaysApi();

  // receive the context to display errors if needed
  static Future<void> updateCheckInInfo(
      BuildContext context, DateTime time, String userEmail) async {
    var res = await _recordsApi
        .apiV1CheckInRecordsEmailDateGet(userEmail, time.toUtc())
        .timeout(_timeout,
            onTimeout: () =>
                DialogManager.showException(context, "Connection timeout"));
    if (res.success) {
      currentCheckIns.value = res.response;
    } else {
      currentCheckIns.value = [];
      DialogManager.showErrors(context, res.errors);
    }
  }

  static Future<void> updatePendingApprovals(
      BuildContext context, String userMail) async {
    var res = await _holidaysApi
        .apiV1HolidaysToApproveEmailGet(userMail)
        .timeout(_timeout,
            onTimeout: () =>
                DialogManager.showException(context, "Connection timeout"));
    if (res.success) {
      pendingApprovals.value = res.response;
    } else {
      pendingApprovals.value = [];
      DialogManager.showErrors(context, res.errors);
    }
  }

  static Future<void> updateUserRequests(
      BuildContext context, String userEmail) async {
    var res = await _holidaysApi
        .apiV1HolidaysEmailFromToGet(
            userEmail,
            fromYear,
            toYear)
        .timeout(_timeout,
            onTimeout: () =>
                DialogManager.showException(context, "Connection timeout"));
    if (res.success) {
      userRequests.value = res.response;
    } else {
      userRequests.value = [];
      DialogManager.showErrors(context, res.errors);
    }
  }
}
