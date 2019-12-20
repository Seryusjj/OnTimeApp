part of swagger.api;

class HolidayRequestRegistration {
  
  DateTime from = null;
  

  DateTime to = null;
  

  String userEmail = null;
  
  HolidayRequestRegistration();

  @override
  String toString() {
    return 'HolidayRequestRegistration[from=$from, to=$to, userEmail=$userEmail, ]';
  }

  HolidayRequestRegistration.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    from = json['from'] == null ? null : DateTime.parse(json['from']);
    to = json['to'] == null ? null : DateTime.parse(json['to']);
    userEmail =
        json['userEmail']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from == null ? '' : from.toUtc().toIso8601String(),
      'to': to == null ? '' : to.toUtc().toIso8601String(),
      'userEmail': userEmail
     };
  }

  static List<HolidayRequestRegistration> listFromJson(List<dynamic> json) {
    return json == null ? new List<HolidayRequestRegistration>() : json.map((value) => new HolidayRequestRegistration.fromJson(value)).toList();
  }

  static Map<String, HolidayRequestRegistration> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HolidayRequestRegistration>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HolidayRequestRegistration.fromJson(value));
    }
    return map;
  }
}

