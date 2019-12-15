part of swagger.api;

class RoleResponse {
  
  String roleName = null;
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  RoleResponse();

  @override
  String toString() {
    return 'RoleResponse[roleName=$roleName, errors=$errors, success=$success, ]';
  }

  RoleResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    roleName =
        json['roleName']
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
      'roleName': roleName,
      'errors': errors,
      'success': success
     };
  }

  static List<RoleResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<RoleResponse>() : json.map((value) => new RoleResponse.fromJson(value)).toList();
  }

  static Map<String, RoleResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RoleResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RoleResponse.fromJson(value));
    }
    return map;
  }
}

