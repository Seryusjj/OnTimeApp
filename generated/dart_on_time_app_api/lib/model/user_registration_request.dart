part of swagger.api;

class UserRegistrationRequest {
  /* The email of the user */
  String email = null;
  
/* The password of the user */
  String password = null;
  
  UserRegistrationRequest();

  @override
  String toString() {
    return 'UserRegistrationRequest[email=$email, password=$password, ]';
  }

  UserRegistrationRequest.fromJson(Map<String, dynamic> json) {
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

  static List<UserRegistrationRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserRegistrationRequest>() : json.map((value) => new UserRegistrationRequest.fromJson(value)).toList();
  }

  static Map<String, UserRegistrationRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserRegistrationRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserRegistrationRequest.fromJson(value));
    }
    return map;
  }
}

