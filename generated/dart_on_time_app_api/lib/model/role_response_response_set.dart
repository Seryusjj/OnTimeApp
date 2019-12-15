part of swagger.api;

class RoleResponseResponseSet {
  
  List<RoleResponse> response = [];
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  RoleResponseResponseSet();

  @override
  String toString() {
    return 'RoleResponseResponseSet[response=$response, errors=$errors, success=$success, ]';
  }

  RoleResponseResponseSet.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    response =
      RoleResponse.listFromJson(json['response'])
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

  static List<RoleResponseResponseSet> listFromJson(List<dynamic> json) {
    return json == null ? new List<RoleResponseResponseSet>() : json.map((value) => new RoleResponseResponseSet.fromJson(value)).toList();
  }

  static Map<String, RoleResponseResponseSet> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RoleResponseResponseSet>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RoleResponseResponseSet.fromJson(value));
    }
    return map;
  }
}

