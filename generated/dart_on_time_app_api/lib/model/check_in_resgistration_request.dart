part of swagger.api;

class CheckInResgistrationRequest {
  
  String userEmail = null;
  

  String info = null;
  

  bool location = null;
  

  DateTime utcDateTime = null;
  

  bool endDay = null;
  
  CheckInResgistrationRequest();

  @override
  String toString() {
    return 'CheckInResgistrationRequest[userEmail=$userEmail, info=$info, location=$location, utcDateTime=$utcDateTime, endDay=$endDay, ]';
  }

  CheckInResgistrationRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userEmail =
        json['userEmail']
    ;
    info =
        json['info']
    ;
    location =
        json['location']
    ;
    utcDateTime = json['utcDateTime'] == null ? null : DateTime.parse(json['utcDateTime']);
    endDay =
        json['endDay']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'info': info,
      'location': location,
      'utcDateTime': utcDateTime == null ? '' : utcDateTime.toUtc().toIso8601String(),
      'endDay': endDay
     };
  }

  static List<CheckInResgistrationRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<CheckInResgistrationRequest>() : json.map((value) => new CheckInResgistrationRequest.fromJson(value)).toList();
  }

  static Map<String, CheckInResgistrationRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CheckInResgistrationRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CheckInResgistrationRequest.fromJson(value));
    }
    return map;
  }
}

