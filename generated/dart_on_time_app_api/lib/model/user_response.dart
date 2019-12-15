part of swagger.api;

class UserResponse {
  
  String email = null;
  

  String userName = null;
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  UserResponse();

  @override
  String toString() {
    return 'UserResponse[email=$email, userName=$userName, errors=$errors, success=$success, ]';
  }

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email =
        json['email']
    ;
    userName =
        json['userName']
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
      'email': email,
      'userName': userName,
      'errors': errors,
      'success': success
     };
  }

  static List<UserResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserResponse>() : json.map((value) => new UserResponse.fromJson(value)).toList();
  }

  static Map<String, UserResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserResponse.fromJson(value));
    }
    return map;
  }
}

