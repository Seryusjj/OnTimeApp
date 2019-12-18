part of swagger.api;

class WorkedTimeResponse {
  
  int hours = null;
  

  int minutes = null;
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  WorkedTimeResponse();

  @override
  String toString() {
    return 'WorkedTimeResponse[hours=$hours, minutes=$minutes, errors=$errors, success=$success, ]';
  }

  WorkedTimeResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    hours =
        json['hours']
    ;
    minutes =
        json['minutes']
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
      'hours': hours,
      'minutes': minutes,
      'errors': errors,
      'success': success
     };
  }

  static List<WorkedTimeResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<WorkedTimeResponse>() : json.map((value) => new WorkedTimeResponse.fromJson(value)).toList();
  }

  static Map<String, WorkedTimeResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WorkedTimeResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WorkedTimeResponse.fromJson(value));
    }
    return map;
  }
}

