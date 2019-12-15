part of swagger.api;

class AuthResponse {
  /* The token assigned to the user */
  String token = null;
  
/* Set of errors that can potentially occur */
  List<String> errors = [];
  
/* If the request was succesfull or not */
  bool success = null;
  
  AuthResponse();

  @override
  String toString() {
    return 'AuthResponse[token=$token, errors=$errors, success=$success, ]';
  }

  AuthResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    token =
        json['token']
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
      'token': token,
      'errors': errors,
      'success': success
     };
  }

  static List<AuthResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthResponse>() : json.map((value) => new AuthResponse.fromJson(value)).toList();
  }

  static Map<String, AuthResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthResponse.fromJson(value));
    }
    return map;
  }
}

