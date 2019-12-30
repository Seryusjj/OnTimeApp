part of swagger.api;

class UserRoleRemoveRequest {
  
  String role = null;
  

  String userEmail = null;
  
  UserRoleRemoveRequest();

  @override
  String toString() {
    return 'UserRoleRemoveRequest[role=$role, userEmail=$userEmail, ]';
  }

  UserRoleRemoveRequest.fromJson(Map<String, dynamic> json) {
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

  static List<UserRoleRemoveRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserRoleRemoveRequest>() : json.map((value) => new UserRoleRemoveRequest.fromJson(value)).toList();
  }

  static Map<String, UserRoleRemoveRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserRoleRemoveRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserRoleRemoveRequest.fromJson(value));
    }
    return map;
  }
}

