part of swagger.api;

class HolidayApproveRequest {
  
  String requestId = null;
  
  HolidayApproveRequest();

  @override
  String toString() {
    return 'HolidayApproveRequest[requestId=$requestId, ]';
  }

  HolidayApproveRequest.fromJson(Map<String, dynamic> json) {
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

  static List<HolidayApproveRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<HolidayApproveRequest>() : json.map((value) => new HolidayApproveRequest.fromJson(value)).toList();
  }

  static Map<String, HolidayApproveRequest> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HolidayApproveRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HolidayApproveRequest.fromJson(value));
    }
    return map;
  }
}

