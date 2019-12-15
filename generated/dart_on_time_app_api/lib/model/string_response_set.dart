part of swagger.api;

class StringResponseSet {
  
  List<String> response = [];
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  StringResponseSet();

  @override
  String toString() {
    return 'StringResponseSet[response=$response, errors=$errors, success=$success, ]';
  }

  StringResponseSet.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    response =
        (json['response'] as List).map((item) => item as String).toList()
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

  static List<StringResponseSet> listFromJson(List<dynamic> json) {
    return json == null ? new List<StringResponseSet>() : json.map((value) => new StringResponseSet.fromJson(value)).toList();
  }

  static Map<String, StringResponseSet> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, StringResponseSet>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new StringResponseSet.fromJson(value));
    }
    return map;
  }
}

