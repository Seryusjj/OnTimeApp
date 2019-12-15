part of swagger.api;

class UserRoleAdditionRequest {
  
  String role = null;
  

  String userEmail = null;
  
  UserRoleAdditionRequest();

  @override
  String toString() {
    return 'UserRoleAdditionRequest[role=$role, userEmail=$userEmail, ]';
  }

  UserRoleAdditionRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    role =
        json['role']
    ;
    userEmail =
        json['userEmail']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'userEmail': userEmail
     };
  }

  static List<UserRoleAdditionRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserRoleAdditionRequest>() : json.map((value) => new UserRoleAdditionRequest.fromJson(value)).toList();
  }

  static Map<String, UserRoleAdditionRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserRoleAdditionRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserRoleAdditionRequest.fromJson(value));
    }
    return map;
  }
}

