part of swagger.api;

class HolidayDeleteRequest {
  
  String requestId = null;
  
  HolidayDeleteRequest();

  @override
  String toString() {
    return 'HolidayDeleteRequest[requestId=$requestId, ]';
  }

  HolidayDeleteRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    requestId =
        json['requestId']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'requestId': requestId
     };
  }

  static List<HolidayDeleteRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<HolidayDeleteRequest>() : json.map((value) => new HolidayDeleteRequest.fromJson(value)).toList();
  }

  static Map<String, HolidayDeleteRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HolidayDeleteRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HolidayDeleteRequest.fromJson(value));
    }
    return map;
  }
}

