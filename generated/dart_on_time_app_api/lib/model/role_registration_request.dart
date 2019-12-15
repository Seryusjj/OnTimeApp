part of swagger.api;

class RoleRegistrationRequest {
  /* The name of the new role */
  String roleName = null;
  
  RoleRegistrationRequest();

  @override
  String toString() {
    return 'RoleRegistrationRequest[roleName=$roleName, ]';
  }

  RoleRegistrationRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    roleName =
        json['roleName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'roleName': roleName
     };
  }

  static List<RoleRegistrationRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<RoleRegistrationRequest>() : json.map((value) => new RoleRegistrationRequest.fromJson(value)).toList();
  }

  static Map<String, RoleRegistrationRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RoleRegistrationRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RoleRegistrationRequest.fromJson(value));
    }
    return map;
  }
}

