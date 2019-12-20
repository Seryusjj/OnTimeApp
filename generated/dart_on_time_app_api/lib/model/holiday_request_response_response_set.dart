part of swagger.api;

class HolidayRequestResponseResponseSet {
  
  List<HolidayRequestResponse> response = [];
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  HolidayRequestResponseResponseSet();

  @override
  String toString() {
    return 'HolidayRequestResponseResponseSet[response=$response, errors=$errors, success=$success, ]';
  }

  HolidayRequestResponseResponseSet.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    response =
      HolidayRequestResponse.listFromJson(json['response'])
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
      'response': response,
      'errors': errors,
      'success': success
     };
  }

  static List<HolidayRequestResponseResponseSet> listFromJson(List<dynamic> json) {
    return json == null ? new List<HolidayRequestResponseResponseSet>() : json.map((value) => new HolidayRequestResponseResponseSet.fromJson(value)).toList();
  }

  static Map<String, HolidayRequestResponseResponseSet> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HolidayRequestResponseResponseSet>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HolidayRequestResponseResponseSet.fromJson(value));
    }
    return map;
  }
}

