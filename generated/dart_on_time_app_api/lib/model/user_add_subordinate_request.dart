part of swagger.api;

class UserAddSubordinateRequest {
  
  String userEmail = null;
  

  String subordinateEmail = null;
  
  UserAddSubordinateRequest();

  @override
  String toString() {
    return 'UserAddSubordinateRequest[userEmail=$userEmail, subordinateEmail=$subordinateEmail, ]';
  }

  UserAddSubordinateRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userEmail =
        json['userEmail']
    ;
    subordinateEmail =
        json['subordinateEmail']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'subordinateEmail': subordinateEmail
     };
  }

  static List<UserAddSubordinateRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserAddSubordinateRequest>() : json.map((value) => new UserAddSubordinateRequest.fromJson(value)).toList();
  }

  static Map<String, UserAddSubordinateRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserAddSubordinateRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserAddSubordinateRequest.fromJson(value));
    }
    return map;
  }
}

