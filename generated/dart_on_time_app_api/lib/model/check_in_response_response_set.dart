part of swagger.api;

class CheckInResponseResponseSet {
  
  List<CheckInResponse> response = [];
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  CheckInResponseResponseSet();

  @override
  String toString() {
    return 'CheckInResponseResponseSet[response=$response, errors=$errors, success=$success, ]';
  }

  CheckInResponseResponseSet.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    response =
      CheckInResponse.listFromJson(json['response'])
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

  static List<CheckInResponseResponseSet> listFromJson(List<dynamic> json) {
    return json == null ? new List<CheckInResponseResponseSet>() : json.map((value) => new CheckInResponseResponseSet.fromJson(value)).toList();
  }

  static Map<String, CheckInResponseResponseSet> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CheckInResponseResponseSet>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CheckInResponseResponseSet.fromJson(value));
    }
    return map;
  }
}

