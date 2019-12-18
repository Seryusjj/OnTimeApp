part of swagger.api;

class CheckInResponse {
  
  String info = null;
  

  DateTime utcDateTime = null;
  
/* If true location is assume else, wifi */
  bool location = null;
  

  bool endDay = null;
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  CheckInResponse();

  @override
  String toString() {
    return 'CheckInResponse[info=$info, utcDateTime=$utcDateTime, location=$location, endDay=$endDay, errors=$errors, success=$success, ]';
  }

  CheckInResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    info =
        json['info']
    ;
    utcDateTime = json['utcDateTime'] == null ? null : DateTime.parse(json['utcDateTime']);
    location =
        json['location']
    ;
    endDay =
        json['endDay']
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
      'info': info,
      'utcDateTime': utcDateTime == null ? '' : utcDateTime.toUtc().toIso8601String(),
      'location': location,
      'endDay': endDay,
      'errors': errors,
      'success': success
     };
  }

  static List<CheckInResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<CheckInResponse>() : json.map((value) => new CheckInResponse.fromJson(value)).toList();
  }

  static Map<String, CheckInResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CheckInResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CheckInResponse.fromJson(value));
    }
    return map;
  }
}

