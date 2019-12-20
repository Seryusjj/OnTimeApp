part of swagger.api;

class HolidayRequestResponse {
  
  String id = null;
  

  DateTime dateFrom = null;
  

  DateTime dateTo = null;
  

  bool approved = null;
  

  String approverEmail = null;
  

  String userEmail = null;
  

  bool deleted = null;
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  HolidayRequestResponse();

  @override
  String toString() {
    return 'HolidayRequestResponse[id=$id, dateFrom=$dateFrom, dateTo=$dateTo, approved=$approved, approverEmail=$approverEmail, userEmail=$userEmail, deleted=$deleted, errors=$errors, success=$success, ]';
  }

  HolidayRequestResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    dateFrom = json['dateFrom'] == null ? null : DateTime.parse(json['dateFrom']);
    dateTo = json['dateTo'] == null ? null : DateTime.parse(json['dateTo']);
    approved =
        json['approved']
    ;
    approverEmail =
        json['approverEmail']
    ;
    userEmail =
        json['userEmail']
    ;
    deleted =
        json['deleted']
    ;
    errors =
        (json['errors'] as List).map((item) => item as String).toList()
    ;
    success =
        json['success']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateFrom': dateFrom == null ? '' : dateFrom.toUtc().toIso8601String(),
      'dateTo': dateTo == null ? '' : dateTo.toUtc().toIso8601String(),
      'approved': approved,
      'approverEmail': approverEmail,
      'userEmail': userEmail,
      'deleted': deleted,
      'errors': errors,
      'success': success
     };
  }

  static List<HolidayRequestResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<HolidayRequestResponse>() : json.map((value) => new HolidayRequestResponse.fromJson(value)).toList();
  }

  static Map<String, HolidayRequestResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HolidayRequestResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HolidayRequestResponse.fromJson(value));
    }
    return map;
  }
}

