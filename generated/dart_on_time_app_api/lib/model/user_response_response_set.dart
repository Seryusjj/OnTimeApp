part of swagger.api;

class UserResponseResponseSet {
  
  List<UserResponse> response = [];
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  UserResponseResponseSet();

  @override
  String toString() {
    return 'UserResponseResponseSet[response=$response, errors=$errors, success=$success, ]';
  }

  UserResponseResponseSet.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    response =
      UserResponse.listFromJson(json['response'])
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

  static List<UserResponseResponseSet> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserResponseResponseSet>() : json.map((value) => new UserResponseResponseSet.fromJson(value)).toList();
  }

  static Map<String, UserResponseResponseSet> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserResponseResponseSet>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserResponseResponseSet.fromJson(value));
    }
    return map;
  }
}

