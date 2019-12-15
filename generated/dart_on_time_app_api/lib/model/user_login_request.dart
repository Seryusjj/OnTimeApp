part of swagger.api;

class UserLoginRequest {
  /* The email of the user */
  String email = null;
  
/* The password of the user */
  String password = null;
  
  UserLoginRequest();

  @override
  String toString() {
    return 'UserLoginRequest[email=$email, password=$password, ]';
  }

  UserLoginRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email =
        json['email']
    ;
    password =
        json['password']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
     };
  }

  static List<UserLoginRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserLoginRequest>() : json.map((value) => new UserLoginRequest.fromJson(value)).toList();
  }

  static Map<String, UserLoginRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserLoginRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserLoginRequest.fromJson(value));
    }
    return map;
  }
}

